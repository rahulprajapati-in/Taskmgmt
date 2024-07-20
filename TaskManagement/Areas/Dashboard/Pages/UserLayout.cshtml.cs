using Microsoft.AspNetCore.Identity;
using Newtonsoft.Json;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using TaskManagement.Model;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;

namespace TaskManagement.Areas.Dashboard.Page
{
    [Authorize]
    public class UserLayoutModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;
        public List<IdentityUser> IdentityUsersList;
        public List<TaskMgnt> TaskList;
        private readonly IConfiguration _configuration;
        public UserLayoutModel(IConfiguration configuration, UserManager<IdentityUser> userManager) 
        {
            _configuration = configuration;
            _userManager = userManager;
        }
        public async void OnGet()
        {
            var GetUsersAPI = string.Format("{0}{1}?userId={2}&&userRole={3}", _configuration["APIURL"], "Task/GetEmployes", User.FindFirstValue(ClaimTypes.NameIdentifier), User.FindFirstValue(ClaimTypes.Role));
            var GetTasksAPI = string.Format("{0}{1}?userId={2}&&userRole={3}", _configuration["APIURL"], "Task/GetTaskList", User.FindFirstValue(ClaimTypes.NameIdentifier), User.FindFirstValue(ClaimTypes.Role));

            using (var client = new HttpClient())
            {
                var cookieValue = Request.Cookies["YourApp.Cookie"];
                client.DefaultRequestHeaders.Add("Cookie", $"YourApp.Cookie={cookieValue}");
                    
                if(User.FindFirstValue(ClaimTypes.Role) != "Employees") 
                {
                    //Get All Users based on role
                    var userAPIRes = client.GetAsync(GetUsersAPI).Result;
                    if (userAPIRes.IsSuccessStatusCode)
                    {
                        var content = await userAPIRes.Content.ReadAsStringAsync();
                        IdentityUsersList = JsonConvert.DeserializeObject<List<IdentityUser>>(content);
                    }
                    else
                    {
                        var errorMessage = $"Error: {userAPIRes.StatusCode}";
                    }
                }
                var TasksAPIRes = client.GetAsync(GetTasksAPI).Result;
                if (TasksAPIRes.IsSuccessStatusCode)
                {
                    var content = await TasksAPIRes.Content.ReadAsStringAsync();
                    TaskList = JsonConvert.DeserializeObject<List<TaskMgnt>>(content);
                }
                else
                {
                    var errorMessage = $"Error: {TasksAPIRes.StatusCode}";
                }
            }
        }

        public async Task<IActionResult> OnGetTaskListPartial(string userId) 
        {
            try
            {
                var user = await _userManager.FindByIdAsync(userId);
                var roles = await _userManager.GetRolesAsync(user);
                var GetTasksAPI = string.Format("{0}{1}?userId={2}&&userRole={3}", _configuration["APIURL"], "Task/GetTaskList", userId, roles.FirstOrDefault());
                using (var client = new HttpClient())
                {
                    var cookieValue = Request.Cookies["YourApp.Cookie"];
                    client.DefaultRequestHeaders.Add("Cookie", $"YourApp.Cookie={cookieValue}");
                    var TasksAPIRes = client.GetAsync(GetTasksAPI).Result;
                    if (TasksAPIRes.IsSuccessStatusCode)
                    {
                        var content = await TasksAPIRes.Content.ReadAsStringAsync();
                        TaskList = JsonConvert.DeserializeObject<List<TaskMgnt>>(content);
                    }
                    else
                    {
                        var errorMessage = $"Error: {TasksAPIRes.StatusCode}";
                    }
                }
                return new PartialViewResult
                {
                    ViewName = "TaskListPartial",
                    ViewData = new ViewDataDictionary<List<TaskMgnt>>(ViewData, TaskList)
                };
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }
    }
}
