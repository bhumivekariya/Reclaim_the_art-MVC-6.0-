using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.Bill.Models
{
    public class BillModel
    {
        public int BillID { get; set; }
        [Required]
        [Range(1, 1000000, ErrorMessage = "Please enter the correct value")]
        public int BillAmount { get; set; }

        [Required]
        [DisplayName("Please enter Status")]
        public string BillStatus { get; set; }
       
        public int CustomerID { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
      
        public int CountryID { get; set; }
       
        public int StateID { get; set; }
       
        public int CityID { get; set; }



    }
}
