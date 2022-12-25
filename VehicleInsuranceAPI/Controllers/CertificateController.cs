using DataAccess.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
            List<CertificatesModel> model = new List<CertificatesModel>();
            model = (from cer in _db.Certificates
                     join cusbill in _db.CustomerBills on cer.PolicyNo equals cusbill.PolicyNo
                     join est in _db.Estimates on cer.EstimateNo equals est.EstimateNo
                     join cus in _db.Customers on cer.CustomerId equals cus.Id
                     join pol in _db.Policies on est.PolicyId equals pol.Id
                     where cer.CustomerId == id
                     select new CertificatesModel
                     {
                         Id = cer.Id,
                         CustomerId = cus.Id,
                         PolicyType = pol.PolicyType,
                         VehicleName = est.VehicleName,
                         VehicleModel = est.VehicleModel,
                         VehicleVersion = est.VehicleVersion,
                         PolicyDuration = est.PolicyDuration,
                         PolicyDate = est.PolicyDate.AddMonths(12).AddDays(-1),
                         PolicyNo = cer.PolicyNo,
                     }).ToList();
            return Ok(model);
        }

        [HttpPost]
        [Route("CreateCertificate")]
        public IActionResult CreateCertificate(Certificate model)
        {
            if (ModelState.IsValid)
            {
                var customer = _db.Customers.Where(p => p.Id == model.CustomerId).FirstOrDefault();
                _db.Attach(customer);
                customer.Certificates.Add(model);
                
                //estimate.Certificates.Add(model);
                //_db.Estimates.Add(model);
                //_db.ChangeTracker.Clear();
                if (_db.SaveChanges() > 0)
                {
                    return Ok(model.PolicyNo);
                }
    //            var local = _context.Set<YourEntity>()
    //.Local
    //.FirstOrDefault(entry => entry.Id.Equals(entryId));

    //            // check if local is not null 
    //            if (local != null)
    //            {
    //                // detach
    //                _context.Entry(local).State = EntityState.Detached;
    //            }
    //            // set Modified flag in your entry
    //            _context.Entry(entryToUpdate).State = EntityState.Modified;

                //// save 
                //_context.SaveChanges();
                return Ok(-1);
            }
            return BadRequest();
        }
    }
}
