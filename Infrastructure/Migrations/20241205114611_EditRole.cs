using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class EditRole : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "5b00f076-9a00-4d2d-afcf-ace896a16c3f", 0, "b2a1a9cf-345c-4927-9b41-2990079e1b05", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEClqcJyK3cznugVe+H0WaMQXqzQq4wiaH4LzmiOrLKNEfFSqESDpJjVOaVZ7BfguVg==", null, false, "7571d858-4201-48e4-a2b8-2de26c77cddb", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", "5b00f076-9a00-4d2d-afcf-ace896a16c3f" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", "5b00f076-9a00-4d2d-afcf-ace896a16c3f" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1ad38a70-9715-48a4-ae27-c78a092292ea");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5b00f076-9a00-4d2d-afcf-ace896a16c3f");

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
    }
}
