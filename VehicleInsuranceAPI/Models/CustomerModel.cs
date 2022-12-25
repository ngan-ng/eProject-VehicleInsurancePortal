namespace VehicleInsuranceAPI.Models
{
    public class CustomerModel
    {
        public string CustomerEmail { get; set; } = null!;

        public string CustomerName { get; set; } = null!;

        public string? CustomerAddress { get; set; }

        public long CustomerPhone { get; set; }
    }
}
