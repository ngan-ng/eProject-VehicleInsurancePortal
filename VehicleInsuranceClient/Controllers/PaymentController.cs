using Microsoft.AspNetCore.Mvc;

namespace VehicleInsuranceClient.Controllers
{
    public class PaymentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
