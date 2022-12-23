
using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Reflection;
using System.Text;
using System.Text.Json;
using VehicleInsuranceClient.Models;

namespace VehicleInsuranceClient.Controllers
{
    public class CertificateController : Controller
    {
        public static List<CertificatesModel> Certificates = new List<CertificatesModel>();

        public IActionResult Index()
        {
            return View();
        }


        public IActionResult DetailsCertificate()
        {
            return View();
        }

        /// <summary>
        /// Create view for ListCertificates
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult GetCertificates([FromBody] List<CertificatesModel> model)
        {
            Certificates = model;
            return View("ListCertificates", model);
        }


        /// <summary>
        /// Create View for customer fill-in the Contract
        /// </summary>
        /// <returns>Contract View</returns>
        [HttpGet]
        [Route("Certificate/Contract/{estimateNo?}")]
        public IActionResult Contract(string estimateNo)
        {
            if(String.IsNullOrEmpty(estimateNo))
            {
                TempData["EstimateNoErrMessage"] = "Please get your estimate!";
                return RedirectToAction("Index", "Estimate", new EstimateClientViewModel());
            }
            var estimateContract = Request.Cookies[estimateNo];
            if (estimateContract == null)
            {
                TempData["EstimateNoErrMessage"] = "Your estimate number is invalid! Please get another!";
                return RedirectToAction("Index", "Estimate", new EstimateClientViewModel());
            }
            EstimationContractModel estimationContract = new EstimationContractModel();
            estimationContract = JsonSerializer.Deserialize<EstimationContractModel>(estimateContract.Normalize())!;

            return View(estimationContract);
        }

        [HttpPost]
        public IActionResult CertificateRegister(EstimationContractModel model)
        {
            if (String.IsNullOrEmpty(model.Estimation.EstimateNo.ToString()))
            {
                TempData["EstimateNoErrMessage"] = "Please get your estimate!";
                return RedirectToAction("Index", "Estimate", new EstimateClientViewModel());
            }
            var estimateContractCookie = Request.Cookies[model.Estimation.EstimateNo.ToString()];
            if (estimateContractCookie == null)
            {
                TempData["EstimateNoErrMessage"] = "Your estimate number is invalid! Please get another!";
                return RedirectToAction("Index", "Estimate", new EstimateClientViewModel());
            }

            EstimationContractModel certificate = new EstimationContractModel();

            certificate = JsonSerializer.Deserialize<EstimationContractModel>(estimateContractCookie.Normalize())!;
            certificate.Contract = model.Contract;
            TimeSpan remain = DateTime.Now.Subtract((DateTime)certificate.Estimation.EstimateDate);
            CookieOptions options = new CookieOptions()
            {
                //Expires = DateTime.Now.AddMinutes(5)
                Expires = DateTime.Now.AddDays(Program.CookieEstimateDuration - remain.TotalDays)
            };
            Response.Cookies.Append(model.Estimation.EstimateNo.ToString(), JsonSerializer.Serialize(certificate), options);
           
            return RedirectToAction("Index", "Payment", model);
        }
    }
}
