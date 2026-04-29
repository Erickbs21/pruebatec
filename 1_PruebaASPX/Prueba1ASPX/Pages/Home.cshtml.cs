using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Prueba1ASPX.Pages
{
    public class HomeModel : PageModel
    {
        public string User { get; set; } = string.Empty;

        public IActionResult OnGet()
        {
            var user = HttpContext.Session.GetString("User");
            if (string.IsNullOrEmpty(user))
            {
                return RedirectToPage("Login");
            }

            User = user;
            return Page();
        }

        public IActionResult OnPostLogout()
        {
            HttpContext.Session.Clear();
            return RedirectToPage("Login");
        }
    }
}
