﻿using System.ComponentModel.DataAnnotations;

namespace VehicleInsuranceAPI.Models
{
    public class CertificateModel
    {
        public int Id { get; set; }
        public int EstimateNo { get; set; }
        public int? CustomerId { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public long CustomerPhone { get; set; }
        public int PolicyNo { get; set; }
        public string PolicyType { get; set; }
        public DateTime PolicyDate { get; set; }
        public int PolicyDuration { get; set; }
        public string VehicleName { get; set; } = null!;
        public string VehicleModel { get; set; } = null!;
        public string VehicleVersion { get; set; }
        public int VehicleNumber { get; set; }
        public string VehicleBodyNumber { get; set; } = null!;
        public string VehicleEngineNumber { get; set; } = null!;
        public string VehicleWarranty { get; set; } = null!;
        public decimal? Premium { get; set; }
        public string? Prove { get; set; }
    }

    public class CertificateAdminModel
    {
        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public long CustomerPhone { get; set; }
        public int PolicyNo { get; set; }
        public string PolicyType { get; set; }
        public DateTime PolicyDate { get; set; }
        public int PolicyDuration { get; set; }
        public string VehicleName { get; set; } = null!;
        public string VehicleModel { get; set; } = null!;
        public string VehicleVersion { get; set; }
        public int VehicleNumber { get; set; }
        public string VehicleBodyNumber { get; set; } = null!;
        public string VehicleEngineNumber { get; set; } = null!;
        public string VehicleWarranty { get; set; } = null!;
        public decimal? Amount { get; set; }
        public string? Prove { get; set; }
        public string? Status { get; set; }
    }

    public class ContractModel
    {
        public Contract? Contract { get; set; } = null!;
        public EstimateViewModel? Estimation { get; set; }
    }
    public class Contract
    {
        //[Required(ErrorMessage = "Vehicle owner name is required")]
        public string CustomerName { get; set; } = String.Empty!;

        //[Required(ErrorMessage = "Customer address is required")]
        public string? CustomerAddress { get; set; }

        //[Required(ErrorMessage = "Phone number is required")]
        //[RegularExpression("^([0-9]{10})$", ErrorMessage = "Invalid Phone Number.")]
        public long CustomerPhone { get; set; }

        [Required(ErrorMessage = "Registration is required")]
        public string VehicleNumber { get; set; } = String.Empty!;

        [Required(ErrorMessage = "Vehicle body number is required")]
        public string VehicleBodyNumber { get; set; } = String.Empty!;

        [Required(ErrorMessage = "Engine number is required")]
        [RegularExpression("^[a-zA-Z0-9-]{6,15}$", ErrorMessage = "6-15 characters not contain the specials")]
        public string VehicleEngineNumber { get; set; } = null!;
        public string? Prove { get; set; }
    }
    public class EstimateViewModel
    {
        public int? EstimateNo { get; set; } = 0;

        [Required(ErrorMessage = "Vehicle Name is required")]
        public string VehicleName { get; set; } = null!;
        [Required(ErrorMessage = "Vehicle Model is required")]
        public string VehicleModel { get; set; } = string.Empty;
        [Required(ErrorMessage = "Vehicle Version is required")]
        public string VehicleVersion { get; set; } = string.Empty;
        [Required]
        public int PolicyId { get; set; }
        [Required(ErrorMessage = "Start date is required")]

        [DataType(DataType.Date)]
        public DateTime? EstimateDate { get; set; } = DateTime.Now!;

        [DataType(DataType.Date)]
        public DateTime? PolicyDate { get; set; } = null!;

        public int PolicyDuration { get; set; } = 12;

        public decimal? Premium { get; set; }
        [Required(ErrorMessage = "Vehicle Rate is required")]
        public decimal VehicleRate { get; set; }
    }
}
