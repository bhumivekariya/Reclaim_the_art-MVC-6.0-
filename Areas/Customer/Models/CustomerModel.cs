using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.Customer.Models
{
    public class CustomerModel
    {
        public int CustomerID { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string CustomerName { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string CustomerPassword { get; set; }

        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }
    public class CustomerNameDropDownModel
    {
        public int CustomerID { get; set; }
        public string? CustomerName { get; set; }
    }
}
