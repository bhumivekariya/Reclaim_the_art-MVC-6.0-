using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.City.Models
{
    public class CityModel
    {

        public int? CityID { get; set; }
        [Required]
        [DisplayName("Please enter City")]
        public string? CityName { get; set; }
        [Required]
        [Range(1, 1000000, ErrorMessage = "Please enter the correct value")]
        public string? Pincode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public int StateID { get; set; }
        public int CountryID { get; set; }

    }
    public class CityDropDownModel
    {
        public int? CityID { get; set; }
        [Required]
        public string CityName { get; set; }
    }
}
