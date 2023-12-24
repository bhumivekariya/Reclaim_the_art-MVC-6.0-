using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.BillWiseProduct.Models
{
    public class BillWiseProductModel
    {
        public int BillWiseProductID { get; set; }
        [Required]
        [Range(1, 100, ErrorMessage = "Please enter the value under 100")]
        public string Quantity { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public int BillID { get; set; }
        public int ProductID { get; set; }

    }
}
