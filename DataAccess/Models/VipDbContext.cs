using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Models;

public partial class VipDbContext : DbContext
{
    public VipDbContext()
    {
    }

    public VipDbContext(DbContextOptions<VipDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Admin> Admins { get; set; }

    public virtual DbSet<Certificate> Certificates { get; set; }

    public virtual DbSet<Claim> Claims { get; set; }

    public virtual DbSet<CompanyExpense> CompanyExpenses { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<CustomerBill> CustomerBills { get; set; }

    public virtual DbSet<Estimate> Estimates { get; set; }

    public virtual DbSet<Policy> Policies { get; set; }

    public virtual DbSet<Vehicle> Vehicles { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Server=TOANN\\SQLEXPRESS;Database=VIP_DB;Trusted_Connection=True;TrustServerCertificate=Yes;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Admin>(entity =>
        {
            entity.HasKey(e => e.AdminId).HasName("PK__Admin__719FE48821D14361");

            entity.ToTable("Admin");

            entity.HasIndex(e => e.UserName, "UQ__Admin__C9F28456F16982E7").IsUnique();

            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UserName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Certificate>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Certific__3214EC278D394A5D");

            entity.ToTable("Certificate");

            entity.HasIndex(e => e.PolicyNo, "UQ__Certific__2E13219639E99FA3").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.Prove)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.VehicleBodyNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleEngineNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleWarranty)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('Not Available')");

            entity.HasOne(d => d.Customer).WithMany(p => p.Certificates)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customer_Certificate");

            entity.HasOne(d => d.EstimateNoNavigation).WithMany(p => p.Certificates)
                .HasPrincipalKey(p => p.EstimateNo)
                .HasForeignKey(d => d.EstimateNo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Estimate_Certificate");
        });

        modelBuilder.Entity<Claim>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Claim__3214EC2791069426");

            entity.ToTable("Claim");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ClaimableAmount).HasColumnType("money");
            entity.Property(e => e.DateOfAccident).HasColumnType("date");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Image)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.InsuredAmount).HasColumnType("money");
            entity.Property(e => e.PlaceOfAccident)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValueSql("('Lodged')");

            entity.HasOne(d => d.PolicyNoNavigation).WithMany(p => p.Claims)
                .HasPrincipalKey(p => p.PolicyNo)
                .HasForeignKey(d => d.PolicyNo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Claim_Certificate");
        });

        modelBuilder.Entity<CompanyExpense>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Company___3214EC27160120EA");

            entity.ToTable("Company_Expense");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AmountOfExpense).HasColumnType("money");
            entity.Property(e => e.DateOfExpense).HasColumnType("date");
            entity.Property(e => e.TypeOfExpense)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Customer__3214EC27A0B23D07");

            entity.ToTable("Customer");

            entity.HasIndex(e => e.CustomerPhone, "UQ__Customer__390618B3071639B0").IsUnique();

            entity.HasIndex(e => e.CustomerEmail, "UQ__Customer__3A0CE74CD7DC1D43").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.CustomerAddress)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CustomerEmail)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.CustomerName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<CustomerBill>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Customer__3214EC2710E927F0");

            entity.ToTable("CustomerBill");

            entity.HasIndex(e => e.BillNo, "UQ__Customer__11F284180B06D542").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Amount).HasColumnType("money");
            entity.Property(e => e.Date)
                .HasDefaultValueSql("(CONVERT([date],getdate()))")
                .HasColumnType("date");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('Pending')");

            entity.HasOne(d => d.PolicyNoNavigation).WithMany(p => p.CustomerBills)
                .HasPrincipalKey(p => p.PolicyNo)
                .HasForeignKey(d => d.PolicyNo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Certificate_Bill");
        });

        modelBuilder.Entity<Estimate>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Estimate__3214EC271B7FFE2D");

            entity.ToTable("Estimate");

            entity.HasIndex(e => e.EstimateNo, "UQ__Estimate__ABEB835B44EC5B65").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.EstimateDate).HasColumnType("date");
            entity.Property(e => e.PolicyDate).HasColumnType("date");
            entity.Property(e => e.PolicyDuration).HasDefaultValueSql("((12))");
            entity.Property(e => e.PolicyId).HasColumnName("PolicyID");
            entity.Property(e => e.Premium).HasColumnType("money");
            entity.Property(e => e.VehicleModel)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleVersion)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Policy).WithMany(p => p.Estimates)
                .HasForeignKey(d => d.PolicyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Estimate_Policy");
        });

        modelBuilder.Entity<Policy>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Policy__3214EC2765A29F2E");

            entity.ToTable("Policy");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Annually).HasColumnType("money");
            entity.Property(e => e.Coverage)
                .HasMaxLength(8000)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.PolicyType)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Vehicle>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Vehicle__3214EC272C077D3E");

            entity.ToTable("Vehicle");

            entity.HasIndex(e => e.VehicleNumber, "UQ__Vehicle__ABAD8859A34A87AA").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.VehicleBodyNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleEngineNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleModel)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleOwnerName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.VehicleRate).HasColumnType("money");
            entity.Property(e => e.VehicleVersion)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
