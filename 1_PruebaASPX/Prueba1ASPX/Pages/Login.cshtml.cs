using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Prueba1ASPX.Pages
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public string Username { get; set; } = string.Empty;

        [BindProperty]
        public string Password { get; set; } = string.Empty;

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (Username == "admin" && Password == "admin123")
            {
                HttpContext.Session.SetString("User", Username);
                return RedirectToPage("Home");
            }

            ModelState.AddModelError(string.Empty, "Credenciales incorrectas");
            return Page();
        }
    }
}
