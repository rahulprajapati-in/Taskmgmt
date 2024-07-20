using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using TaskManagement.Model;

namespace TaskManagement.Services
{
    public interface ITaskServices
    {
        Task<List<IdentityUser>> GetUsersList(string userId,string userRole);
        Task<string> AddTask(TaskMgnt taskMgnt);
        Task<List<TaskMgnt>> GetTaskList(string userId, string userRole);
    }
}
