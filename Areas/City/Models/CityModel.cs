using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.City.Models
{
    public class CityModel
    {

        public int? CityID { get; set; }
        public string? CityName { get; set; }
        public string? Pincode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
        public int StateID { get; set; }
        public int CountryID { get; set; }

    }
    public class CityDropDownModel
    {
        public int? CityID { get; set; }
        public string? CityName { get; set; }
    }
}
