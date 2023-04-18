using System.ComponentModel.DataAnnotations;

namespace Reclaim_the_art.Areas.Country.Models
{
    public class CountryModel
    {
        public int? CountryID { get; set; }
       
        public string? CountryName { get; set; }
     
        public string? CountryCode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModificationDate { get; set; }
    }
    public class CountryDropDownModel
    {
        public int CountryID { get; set; }
        public string? CountryName { get; set; }
    }
}
