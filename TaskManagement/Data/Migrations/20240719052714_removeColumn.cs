using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TaskManagement.Data.Migrations
{
    /// <inheritdoc />
    public partial class removeColumn : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TeamLeadersId",
                table: "UsersMap");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "TeamLeadersId",
                table: "UsersMap",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
