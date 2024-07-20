// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace TaskManagement.Areas.Identity.Pages.Account
{
    public class LoginModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ILogger<LoginModel> _logger;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public LoginModel(SignInManager<IdentityUser> signInManager, ILogger<LoginModel> logger, UserManager<IdentityUser> userManager,
            RoleManager<IdentityRole> roleManager)
        {
            _signInManager = signInManager;
            _logger = logger;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public IList<AuthenticationScheme> ExternalLogins { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public string ReturnUrl { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [TempData]
        public string ErrorMessage { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [EmailAddress]
            public string Email { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [DataType(DataType.Password)]
            public string Password { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Display(Name = "Remember me?")]
            public bool RememberMe { get; set; }
        }

        public async Task OnGetAsync(string returnUrl = null)
        {
            if (!string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }

            returnUrl ??= Url.Content("~/");

            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);

            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            ReturnUrl = returnUrl;
        }

        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl ??= Url.Content("~/");

            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            if (ModelState.IsValid)
            {
                // This doesn't count login failures towards account lockout
                // To enable password failures to trigger account lockout, set lockoutOnFailure: true

                //var user = await _userManager.FindByIdAsync("8816f871-ed40-4cef-bf58-ac29ebe0f550"); // emp
                //var user1 = await _userManager.FindByIdAsync("6bbeb334-887e-4f5a-b471-36600378ee71");
                //var user2 = await _userManager.FindByIdAsync("3ed74dd0-3853-4c35-b860-fdf908fff141");
                //var user3 = await _userManager.FindByIdAsync("cc7198b2-dc63-403e-b92a-b10c685bf82e");
                //var user4 = await _userManager.FindByIdAsync("0b4bb3c5-509e-4082-908c-f63f12d97537");// manager
                //var user5 = await _userManager.FindByIdAsync("5993cf78-c065-41e9-97b7-da4cafa28a55");
                //var user6 = await _userManager.FindByIdAsync("0d840b19-0a37-4da4-a974-14abeda7416a");
                //var user7 = await _userManager.FindByIdAsync("d4199c37-558a-48de-9da7-a00f55fd6488");
                //var user8 = await _userManager.FindByIdAsync("1baaa65f-ba22-4c71-a74b-eea42d5e5058"); // admin 
                //var user9 = await _userManager.FindByIdAsync("173d6068-985b-4a75-ab81-c113b1b57935");
                
                //await _userManager.AddToRoleAsync(user, "Employees");
                //await _userManager.AddToRoleAsync(user1, "Employees");
                //await _userManager.AddToRoleAsync(user2, "Employees");
                //await _userManager.AddToRoleAsync(user3, "Employees");
                //await _userManager.AddToRoleAsync(user9, "Employees");

                //await _userManager.AddToRoleAsync(user4, "Managers");
                //await _userManager.AddToRoleAsync(user5, "Managers");
                //await _userManager.AddToRoleAsync(user6, "Managers");
                //await _userManager.AddToRoleAsync(user7, "Managers");
                
                //await _userManager.AddToRoleAsync(user8, "Admin");

                var result = await _signInManager.PasswordSignInAsync(Input.Email, Input.Password, Input.RememberMe, lockoutOnFailure: false);
                if (result.Succeeded)
                {
                    _logger.LogInformation("User logged in.");
                    return RedirectToPage("/UserLayout", new { area = "Dashboard" });
                }
                if (result.RequiresTwoFactor)
                {
                    return RedirectToPage("./LoginWith2fa", new { ReturnUrl = returnUrl, RememberMe = Input.RememberMe });
                }
                if (result.IsLockedOut)
                {
                    _logger.LogWarning("User account locked out.");
                    return RedirectToPage("./Lockout");
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                    return Page();
                }
            }

            // If we got this far, something failed, redisplay form
            return Page();
        }
    }
}
