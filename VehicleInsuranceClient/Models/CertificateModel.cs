using System.ComponentModel.DataAnnotations;

namespace VehicleInsuranceClient.Models
{
    public class CertificateModel
    {
        public long Id { get; set; }
        public int PolicyNo { get; set; }
        public string PolicyType { get; set; }
        public int BillNo { get; set; }
        public decimal Premium { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public long CustomerPhone { get; set; }
        public int VehicleNumber { get; set; }
        public string VehicleName { get; set; } = null!;
        public string VehicleOwnerName { get; set; } = null!;
        public string VehicleModel { get; set; } = null!;
        public string VehicleVersion { get; set; }
        public DateTime PolicyDate { get; set; }
        public int PolicyDuration { get; set; }
        public string VehicleWarranty { get; set; } = null!;
        public string? Prove { get; set; }
    }

    public class CertificatesModel
    {
        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public string PolicyType { get; set; }
        public string VehicleName { get; set; } = null!;
        public string VehicleModel { get; set; } = null!;
        public string VehicleVersion { get; set; }
        public int PolicyNo { get; set; }
        public int PolicyDuration { get; set; }
        public DateTime PolicyDate { get; set; }
    }
    public class ContractModel
    {
        [Required(ErrorMessage = "Vehicle owner name is required")]
        public string CustomerName { get; set; } = String.Empty!;

        [Required(ErrorMessage = "Customer address is required")]
        public string? CustomerAddress { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [RegularExpression("^([0-9]{10})$", ErrorMessage = "Invalid Phone Number.")]
        public long CustomerPhone { get; set; }

        [Required(ErrorMessage = "Registration is required")]
        public string VehicleNumber { get; set; } = String.Empty!;

        [Required(ErrorMessage = "Vehicle body number is required")]
        public string VehicleBodyNumber { get; set; } = String.Empty!;

        [Required(ErrorMessage = "Engine number is required")]
        [RegularExpression("^[a-zA-Z0-9]{6,15}$", ErrorMessage = "6-15 characters not contain the specials")]
        public string VehicleEngineNumber { get; set; } = null!;
        public string Prove { get; set; }
        public EstimateClientViewModel estimateModel { get; set; }

    }
}
