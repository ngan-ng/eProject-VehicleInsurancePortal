﻿
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NuGet.Protocol.Plugins;
using System;
using System.Net.Http.Json;
using System.Net.WebSockets;
using System.Security.Claims;
using System.Security.Policy;
using System.Text;

using VehicleInsuranceClient.Models.Contants;
using VehicleInsuranceClient.Models.Dtos;
//using DataAccess.Models;

namespace VehicleInsuranceClient.Controllers
{
  
    public class AccountController : Controller
    {
        private string urlCustomer = "https://localhost:7008/api/Customer/";
        private string urlAccount = "https://localhost:7008/api/Account/";
      
        HttpClient client = new HttpClient();

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet("Login")]
        public IActionResult Login(string? returnUrl)
        {
            if (!string.IsNullOrEmpty(returnUrl))
            {
                ViewBag.returnUrl = returnUrl;
                return View();
            }
            else
            {
                ViewBag.returnUrl = "";
                return View();
            }

        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login(CustomerDto cus, string? returnUrl)
        {
            try
            {
                client.BaseAddress = new Uri(urlCustomer);
                if (cus.CustomerEmail != null)
                {
                    var req = new LoginDto
                    {
                        Username = cus.CustomerEmail,
                        Password = cus.Password
                    };
                    var res = await client.PostAsync(RequestUriContants.Login, new StringContent(JsonConvert.SerializeObject(req), Encoding.UTF8, "application/json"));
                    var customer = JsonConvert.DeserializeObject<CustomerDto>(await res.Content.ReadAsStringAsync());
                    if (customer != null)
                    {
                        //luu session
                        var str = JsonConvert.SerializeObject(customer);
                        HttpContext.Session.SetString("user", str);
                        ViewBag.msg = string.Format("Login successfull");
                        ViewBag.user = customer;
                        if(returnUrl != null)
                        {
                            return Redirect(returnUrl);
                        }
                        return RedirectToAction("Index", "Certificate");
                    }
                    else
                    {
                        ViewBag.msg = string.Format("Customer email or password incorrect.Please re-enter");
                        return View();
                    }
                }
                ViewBag.msg = string.Format("Customer email or password incorrect.Please re-enter");
                return View();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }


        }
        public async Task<IActionResult> Logout()
        {
            foreach (var cookie in Request.Cookies.Keys)
            {
                Response.Cookies.Delete(cookie);
            }
            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }

        //public async Task<IActionResult> Register()
        //{
        //    return View();
        //}

        //[HttpPost("Register")]
        //public async Task<IActionResult> Register(DataAccess.Models.Customer customer)
        //{
        //    var model = client.PostAsJsonAsync<DataAccess.Models.Customer>(urlCustomer, customer).Result;
        //    if (model.IsSuccessStatusCode)
        //    {
        //        TempData["UpdateOK"] = "Create New Account Successfully";
        //        return RedirectToAction("Customer");
        //    }
        //    return RedirectToAction("Login");


        //}

        [HttpGet]
        public async Task<IActionResult> SignUp()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(SignUpDto signUpDto)
        {
            var model = client.PostAsJsonAsync<SignUpDto>(urlCustomer, signUpDto).Result;
            if (model.IsSuccessStatusCode)
            {
                TempData["UpdateOK"] = "Create New Account Successfully";
                return RedirectToAction("Customer");
            }
            return RedirectToAction("Login");
        }
    }
}
