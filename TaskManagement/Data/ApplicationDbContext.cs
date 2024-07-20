using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TaskManagement.Model;

namespace TaskManagement.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<UsersMap> UsersMap { get; set; }
        public DbSet<TaskMgnt> TaskMgnt { get; set; }        
    }
}
