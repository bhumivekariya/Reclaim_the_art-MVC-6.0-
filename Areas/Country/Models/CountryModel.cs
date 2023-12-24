using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.Country.Models
{
    public class CountryModel
    {
        public int? CountryID { get; set; }

        [Required]
        [DisplayName("Please enter")]
        public string CountryName { get; set; }
        [Required]
        [DisplayName("Please enter")]
        public string CountryCode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
    }
    public class CountryDropDownModel
    {
        public int CountryID { get; set; }
        [Required]
        public string? CountryName { get; set; }
    }
}
