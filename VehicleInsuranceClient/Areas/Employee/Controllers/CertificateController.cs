﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text;
using VehicleInsuranceClient.Areas.Employee.Models;
using VehicleInsuranceClient.Controllers;
using VehicleInsuranceClient.Models;

namespace VehicleInsuranceClient.Areas.Employee.Controllers
{
    [Area("Employee")]
    public class CertificateController : Controller
    {
        public HttpClient client = new HttpClient();

        [HttpGet]
        public IActionResult Index()
        {
            var userString = HttpContext.Session.GetString("admin");
            if (userString == null)
            {
                return RedirectToAction("LoginAdmin", "Account");
            }

            var model = JsonConvert.DeserializeObject<IEnumerable<CertificateModel>>(client.GetStringAsync(Program.ApiAddress + "/Certificate/GetAllCertificates").Result);
            return View(model);
        }

        [HttpGet]
        public IActionResult CertificateDetail(int CertId, bool? isSuccess = null)
        {
            if(isSuccess != null)
            {
                ViewBag.isSuccess = isSuccess;
            }
            var userString = HttpContext.Session.GetString("admin");
            if (userString == null)
            {
                string returnUrl = HttpContext.Request.Path;
                return RedirectToAction("LoginAdmin", "Account", new { returnUrl = returnUrl });
            }
            if (CertId == 0)
            {
                return NotFound();
            }
            var model = JsonConvert.DeserializeObject<CertificateModel>(client.GetStringAsync(Program.ApiAddress + "/Certificate/GetCertificateDetail/" + CertId).Result)!;
            if (model == null)
            {
                return NotFound();
            }
            string[] imageStrArr = model.Prove.Split('&');
            string[] images = new string[imageStrArr.Length - 1];
            for (int i = 1; i < imageStrArr.Length; i++)
            {
                images[i - 1] = "&" + imageStrArr[i];
            }
            ViewBag.Directory = imageStrArr[0];
            ViewBag.Proves = images;
            return View(model);
        }

        public IActionResult UpdateCertificate()
        {
            return View();
        }
        /// <summary>
        /// Update Certificate
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult CertificateDetail([FromForm] UpdateCertModel model)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = false;
                using var client = new HttpClient();
                StringContent stringContent = new StringContent(System.Text.Json.JsonSerializer.Serialize(new
                {
                    PolicyNo = model.PolicyNo,
                    VehicleNumber = model.VehicleNumber,
                    VehicleBodyNumber = model.VehicleBodyNumber,
                    VehicleEngineNumber = model.VehicleEngineNumber,
                    PolicyDate = model.PolicyDate,
                    VehicleWarranty = model.VehicleWarranty
                }), Encoding.UTF8, "application/json"); // End StringContent

                var response = client.PutAsync(Program.ApiAddress + "/Certificate/UpdateCertificate", stringContent).Result;
                var data = response.Content.ReadAsStringAsync().Result;
                if (data == null || !data.Equals("Success"))
                {
                    isSuccess = false;
                    return View(model);
                }
                isSuccess = true;
                return RedirectToAction("CertificateDetail", new { CertId = model.Id, isSuccess = isSuccess });
            }
            return RedirectToAction("CertificateDetail", new { CertId = model.Id });
        }
    }
}
