using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TaskManagement.Model;
using TaskManagement.Services;

namespace TaskManagement.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class TaskController : ControllerBase
    {
        private readonly ITaskServices _taskServices;
        public TaskController(ITaskServices taskServices) 
        {
            _taskServices = taskServices;
        }

        /// <summary>
        /// This method is used for getting the employess List.
        /// </summary>
        /// <param name="userId">userid</param>
        /// <param name="userRole">userrole</param>
        /// <returns>List of users</returns>
        [HttpGet("GetEmployes")]
        public async Task<List<IdentityUser>> GetEmployes(string userId,string userRole) 
        {
            return await _taskServices.GetUsersList(userId, userRole);
        }

        /// <summary>
        /// This method is used for create a new task into db.
        /// </summary>
        /// <param name="taskMgnt">Task details</param>
        /// <returns>status of task</returns>
        [HttpPost("CreateTask")]
        public async Task<string> CreateTask(TaskMgnt taskMgnt)
        {
            return await _taskServices.AddTask(taskMgnt);
        }

        /// <summary>
        /// This method is used for getting the task list from db.
        /// </summary>
        /// <param name="userId">userId</param>
        /// <returns>List of tasks</returns>
        [HttpGet("GetTaskList")]
        public async Task<List<TaskMgnt>> GetTaskList(string userId, string userRole)
        {
            try 
            {
                return await _taskServices.GetTaskList(userId, userRole);
            }
            catch (Exception ex) 
            {
                throw new Exception(ex.Message.ToString());
            }
        }
    }
}
