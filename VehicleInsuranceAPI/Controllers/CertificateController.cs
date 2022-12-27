using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Text;
using VehicleInsuranceAPI.Models;

namespace VehicleInsuranceAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CertificateController : ControllerBase
    {
        private readonly VipDbContext _db;
        public CertificateController(VipDbContext db)
        {
            _db = db;
        }

        /// <summary>
        /// Get certificates of a customer
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("GetCertificates")]
        public IActionResult GetCertificates(int id)
        {
            List<CertificateModel> model = new List<CertificateModel>();
            
            model = (from cer in _db.Certificates
                     join est in _db.Estimates on cer.EstimateNo equals est.EstimateNo
                     join cus in _db.Customers on cer.CustomerId equals cus.Id
                     join pol in _db.Policies on est.PolicyId equals pol.Id
                     where cer.CustomerId == id
                     select new CertificateModel
                     {
                         Id = cer.Id,
                         EstimateNo = est.EstimateNo,
                         CustomerEmail = cus.CustomerEmail,
                         CustomerName = cus.CustomerName,
                         CustomerAddress = cus.CustomerAddress,
                         CustomerPhone = cus.CustomerPhone,
                         PolicyNo = cer.PolicyNo,
                         PolicyType = pol.PolicyType,
                         PolicyDate = est.PolicyDate,
                         PolicyDuration = est.PolicyDuration,
                         VehicleName = est.VehicleName,
                         VehicleModel = est.VehicleModel,
                         VehicleVersion = est.VehicleVersion,
                         VehicleNumber = cer.VehicleNumber,
                         VehicleBodyNumber = cer.VehicleBodyNumber,
                         VehicleEngineNumber = cer.VehicleEngineNumber,
                         VehicleWarranty = cer.VehicleWarranty,
                         Premium = est.Premium,
                         Prove = cer.Prove
                     }).ToList();
            _db.Dispose();
            return Ok(model);
        }

        [HttpPost]
        [Route("CreateCertificate")]
        public IActionResult CreateCertificate(Certificate model)
        {
            if (ModelState.IsValid)
            {
                _db.Entry(model.Customer).State = EntityState.Unchanged;
                _db.Entry(model.EstimateNoNavigation.Policy).State = EntityState.Unchanged;
                _db.Certificates.Add(model);
                if (_db.SaveChanges() > 0)
                {
                    return Ok(model.PolicyNo);
                }
                return Ok(-1);
            }
            return BadRequest();
        }

    }
}