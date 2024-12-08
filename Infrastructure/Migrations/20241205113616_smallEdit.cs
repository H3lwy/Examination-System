using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class smallEdit : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", "3f25c510-cff1-428c-a4e2-bc800e85a941" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "262fce93-9651-4a31-80c0-3684084ac825");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "3f25c510-cff1-428c-a4e2-bc800e85a941");

            migrationBuilder.AddColumn<TimeSpan>(
                name: "TimeLimit",
                table: "Exams",
                type: "time",
                nullable: false,
                defaultValue: new TimeSpan(0, 0, 0, 0, 0));

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "5d4750bc-f402-4e5c-a69e-87b848f61583", null, "Hisham", "HISHAM" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "1bf3862c-72db-4ff2-b856-38b818e28fa5", 0, "2280000b-c963-41be-b231-26ca2dac109e", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEGFnsc57ab0BqvHCeYQmhPSjXFj60dEs+PFZou2oDHuOJhJ30nIT3ni+LmZ4X8lxzw==", null, false, "2795c053-96f8-4a8e-a7e5-cc35c3f13329", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "5d4750bc-f402-4e5c-a69e-87b848f61583", "1bf3862c-72db-4ff2-b856-38b818e28fa5" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "5d4750bc-f402-4e5c-a69e-87b848f61583", "1bf3862c-72db-4ff2-b856-38b818e28fa5" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "5d4750bc-f402-4e5c-a69e-87b848f61583");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1bf3862c-72db-4ff2-b856-38b818e28fa5");

            migrationBuilder.DropColumn(
                name: "TimeLimit",
                table: "Exams");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", null, "Hisham", "HISHAM" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "3f25c510-cff1-428c-a4e2-bc800e85a941", 0, "a5d84ba5-3032-43b6-95a0-99495c264d65", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEHDEyuMVDkwpGw3EOdfU/bMAyRv7sw/owPuXndv3pD96wTmZEshHlOhAO1XakHhb9Q==", null, false, "e35942f3-71c7-4f21-92e6-19b85502e187", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "262fce93-9651-4a31-80c0-3684084ac825", "3f25c510-cff1-428c-a4e2-bc800e85a941" });
        }
    }
}
