namespace Reclaim_the_art.Areas.Customer.Models
{
    public class CustomerModel
    {
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerPassword { get; set; }

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }
}
