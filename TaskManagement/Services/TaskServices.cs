using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging;
using System.Collections.Generic;
using System.Linq.Expressions;
using TaskManagement.Data;
using TaskManagement.Model;

namespace TaskManagement.Services
{
    public class TaskServices : ITaskServices
    {
        private readonly ApplicationDbContext _applicationDbContext;
        public TaskServices(ApplicationDbContext applicationDbContext) 
        {
            _applicationDbContext = applicationDbContext;
        }

        /// <summary>
        /// Thie method is used for the get users list
        /// </summary>
        /// <param name="userId">userid</param>
        /// <param name="userRole">userRole</param>
        /// <returns>List of users</returns>
        public async Task<List<IdentityUser>> GetUsersList(string userId,string userRole) 
        {
            if (userRole == "Managers")
            {
                List<IdentityUser> identityUsers = new List<IdentityUser>(); 
                var result = from userstbl in _applicationDbContext.Users
                             join
                                 ManagerUser in _applicationDbContext.UsersMap on userstbl.Id equals ManagerUser.EmployeeId
                             where ManagerUser.ManagerId == userId
                             select new List<IdentityUser> { userstbl };

                foreach (var user in result)
                {
                    identityUsers.AddRange(user);
                }
                return identityUsers;
            }
            else if(userRole == "Admin") 
            {
                return _applicationDbContext.Users.ToList();
            }
            return null;
        }

        /// <summary>
        /// This method is create for create task for employee
        /// </summary>
        /// <param name="taskMgnt">task details</param>
        /// <returns>status of task</returns>
        public async Task<string> AddTask(TaskMgnt taskMgnt) 
        {
            try 
            {
                var result = _applicationDbContext.TaskMgnt.Add(taskMgnt);
                _applicationDbContext.SaveChanges();
                return "Success";
            }
            catch (Exception ex) 
            {
                return ex.Message.ToString();
            }
        }

        /// <summary>
        /// This method is create for get task list 
        /// </summary>
        /// <param name="userId">userid</param>
        /// <param name="userRole">userRole</param>
        /// <returns>List os task</returns>
        /// <exception cref="Exception"></exception>
        public async Task<List<TaskMgnt>> GetTaskList(string userId, string userRole) 
        {
            try 
            {
                List<TaskMgnt> listTasks = new List<TaskMgnt>();
                if (userRole == "Employees")
                {
                    return _applicationDbContext.TaskMgnt.Where(x => x.EmployeeId == userId).ToList();
                }
                else if (userRole == "Managers")
                {
                    var result = from TaskMgnttbl in _applicationDbContext.TaskMgnt
                                join ManagerUser in _applicationDbContext.UsersMap on TaskMgnttbl.EmployeeId equals ManagerUser.EmployeeId
                                where ManagerUser.ManagerId == userId
                                select new List<TaskMgnt> { TaskMgnttbl };

                    foreach (var item in result)
                    {
                        listTasks.AddRange(item);
                    }
                    return listTasks;
                }
                else if (userRole == "Admin")
                {
                    return _applicationDbContext.TaskMgnt.ToList();
                }
                return listTasks;
            }
            catch (Exception ex) 
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
