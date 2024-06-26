using System.ComponentModel.DataAnnotations;

namespace FerryBookingMVC.Models
{
    public class GuestViewModel
    {
        [Required(ErrorMessage = "Name is required")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "Invalid input: Only letters and spaces are allowed")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Age is required")]
        [Range(0, 120, ErrorMessage = "Please enter a valid age between 0 and 120")]
        public int Age { get; set; }

        [Required(ErrorMessage = "Gender is required")]
        public string Gender { get; set; }
    }
}
