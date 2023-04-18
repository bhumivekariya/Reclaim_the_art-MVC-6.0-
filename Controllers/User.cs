using Microsoft.AspNetCore.Mvc;

namespace Reclaim_the_art.Controllers
{
    public class User : Controller
    {
        public IActionResult Index()
        {
            return View("User");
        }
    }
}
