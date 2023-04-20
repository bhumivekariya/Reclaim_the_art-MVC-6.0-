using Microsoft.AspNetCore.Mvc;

namespace Reclaim_the_art.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View("Home");
        }
        public IActionResult Shop()
        {
            return View();
        }
        public IActionResult Service()
        {
            return View();
        }
    }
}
