using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using TaskManagement.Data;
using TaskManagement.Extension;
using TaskManagement.Services;

namespace TaskManagement
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
            builder.Services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(connectionString));
            builder.Services.AddDatabaseDeveloperPageExceptionFilter();

            builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddRoles<IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>();
            builder.Services.ConfigureApplicationCookie(options =>
            {
                options.Cookie.Name = "YourApp.Cookie";
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromMinutes(30); // Adjust as needed
                options.LoginPath = "/Identity/Account/Login"; // Customize login path
                options.AccessDeniedPath = "/Account/AccessDenied"; // Customize access denied path
                options.SlidingExpiration = true;
            });
            builder.Services.AddRazorPages();
            builder.Services.AddControllers();


            //Add DI 
            builder.Services.AddScoped<ITaskServices, TaskServices>();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.CreateRolesAsync(builder.Configuration);
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();            
            app.UseEndpoints(endpoints => { endpoints.MapRazorPages(); endpoints.MapControllers(); });

            app.MapRazorPages();

            app.Run();
        }
    }
}
