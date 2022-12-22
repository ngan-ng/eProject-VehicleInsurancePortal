
using Microsoft.AspNetCore.Mvc;
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
            var estimateCookie = Request.Cookies[estimateNo];
            if (estimateCookie == null)
            {
                TempData["EstimateNoErrMessage"] = "Your estimate number is invalid! Please get another!";
                return RedirectToAction("Index", "Estimate", new EstimateClientViewModel());
            }


            ViewBag.EstimateNo = JsonSerializer.Deserialize<EstimateClientViewModel>(estimateCookie.Normalize());

            CertificateContractModel contractModel = new CertificateContractModel();
            contractModel.estimateModel = JsonSerializer.Deserialize<EstimateClientViewModel>(estimateCookie.Normalize());

            return View(contractModel);
        }

        [HttpPost]
        public IActionResult Contract([FromBody] CertificateContractModel model)
        {
            if (ModelState.IsValid)
            {

            }
            return View(model);
        }
    }
}
