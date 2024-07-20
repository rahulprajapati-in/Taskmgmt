using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Security.Claims;
using System.Text;
using TaskManagement.Model;

namespace TaskManagement.Areas.Dashboard.Pages
{
    [Authorize(Roles = "Admin")]
    public class TaskManageDetailsModel : PageModel
    {
        [BindProperty]
        public TaskMgnt taskDetail { get; set; }    
        public List<IdentityUser> IdentityUsersList;
        private readonly IConfiguration _configuration;
        public TaskManageDetailsModel(IConfiguration configuration) 
        {
            _configuration = configuration;
        }

        public async void OnGet()
        {
            try
            {
                var GetUsersAPI = string.Format("{0}{1}?userId={2}&&userRole={3}", _configuration["APIURL"], "Task/GetEmployes", User.FindFirstValue(ClaimTypes.NameIdentifier), User.FindFirstValue(ClaimTypes.Role));
                using (var client = new HttpClient())
                {
                    var cookieValue = Request.Cookies["YourApp.Cookie"];
                    client.DefaultRequestHeaders.Add("Cookie", $"YourApp.Cookie={cookieValue}");

                    if (User.FindFirstValue(ClaimTypes.Role) != "Employees")
                    {
                        //Get All Users based on role
                        var userAPIRes = client.GetAsync(GetUsersAPI).Result;
                        if (userAPIRes.IsSuccessStatusCode)
                        {
                            var content = await userAPIRes.Content.ReadAsStringAsync();
                            IdentityUsersList = JsonConvert.DeserializeObject<List<IdentityUser>>(content);
                            ViewData["IdentityUsersList"] = IdentityUsersList;
                        }
                        else
                        {
                            var errorMessage = $"Error: {userAPIRes.StatusCode}";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }

        public async Task<IActionResult> OnPost() 
        {
            try
            {
                var CreateUsersAPI = string.Format("{0}{1}", _configuration["APIURL"], "Task/CreateTask");
                using (var client = new HttpClient())
                {
                    taskDetail.CreatedBy = User.FindFirstValue(ClaimTypes.NameIdentifier);

                    var cookieValue = Request.Cookies["YourApp.Cookie"];
                    client.DefaultRequestHeaders.Add("Cookie", $"YourApp.Cookie={cookieValue}");                    
                    string modelJson = JsonConvert.SerializeObject(taskDetail);
                    var contentType = new StringContent(modelJson, Encoding.UTF8, "application/json");
                    //Get All Users based on role
                    var userAPIRes = client.PostAsync(CreateUsersAPI, contentType).Result;
                    if (userAPIRes.IsSuccessStatusCode)
                    {
                        var content = await userAPIRes.Content.ReadAsStringAsync();
                    }
                    else
                    {
                        var errorMessage = $"Error: {userAPIRes.StatusCode}";
                    }
                }
            }
            catch(Exception ex) 
            {
                throw new Exception(ex.Message.ToString());
            }
            return RedirectToPage("/UserLayout", new { area = "Dashboard" }); ;
        } 

    }
}
