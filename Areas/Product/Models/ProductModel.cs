
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.Product.Models
{
    public class ProductModel
    {
        public int ProductID { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string ProductName { get; set; }
        
        public IFormFile File { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string ProductPicture { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string ProductDiscription { get; set; }
        [Required]
        [Range(1, 1000000, ErrorMessage = "Please enter the correct value")]
        public int ProductPrice { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string ProductDiscount { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Please enter the correct value")]
        public int ProductTypeID { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "Please enter the correct value")]
        public int CustomerID { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }

    }

    public class ProductNameDropDownModel
    {
        public int ProductID { get; set; }
        public string? ProductName { get; set; }
    }
}
