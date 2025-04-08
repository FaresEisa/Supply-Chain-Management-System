using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using NUnit.Framework;
using a1.Models;

namespace a1.Tests
{
    [TestFixture]
    public class CategoryTests
    {
        [Test]
        public void DefaultSubcategoriesNotNull()
        {
            var category = new Category();
            Assert.IsNotNull(category.Subcategories);
            Assert.AreEqual(0, category.Subcategories.Count);
        }

        [Test]
        public void AddSubcategoryWorks()
        {
            var category = new Category();
            var subcategory = new Subcategory { SubcategoryName = "Test Subcategory", CategoryId = 1 };
            category.Subcategories.Add(subcategory);
            Assert.AreEqual(1, category.Subcategories.Count);
        }
    }

    [TestFixture]
    public class SubcategoryTests
    {
        [Test]
        public void CanAssignCategory()
        {
            var category = new Category { Id = 1, ClassName = "Test", CategoryType = "Type" };
            var subcategory = new Subcategory { Id = 1, SubcategoryName = "Sub", CategoryId = category.Id, Category = category };
            Assert.AreEqual(category, subcategory.Category);
        }

        [Test]
        public void ItemsPropertyCanBeAssigned()
        {
            var subcategory = new Subcategory();
            var items = new List<Item> { new Item { Id = 1, ItemName = "Item1", SubcategoryId = 1, Stock = 10, Price = 5.99m } };
            subcategory.Items = items;
            Assert.IsNotNull(subcategory.Items);
            Assert.AreEqual(1, subcategory.Items.Count);
        }
    }

    [TestFixture]
    public class ItemTests
    {
        private IList<ValidationResult> ValidateModel(object model)
        {
            var context = new ValidationContext(model);
            var results = new List<ValidationResult>();
            Validator.TryValidateObject(model, context, results, true);
            return results;
        }

        [Test]
        public void ValidItemPassesValidation()
        {
            var item = new Item { Id = 1, ItemName = "Valid Item", SubcategoryId = 1, Stock = 10, Price = 10.99m };
            var results = ValidateModel(item);
            Assert.AreEqual(0, results.Count);
        }

        [Test]
        public void NullItemNameFailsValidation()
        {
            var item = new Item { Id = 1, ItemName = null, SubcategoryId = 1, Stock = 10, Price = 10.99m };
            var results = ValidateModel(item);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void OverlyLongItemNameFailsValidation()
        {
            var longName = new string('a', 256);
            var item = new Item { Id = 1, ItemName = longName, SubcategoryId = 1, Stock = 10, Price = 10.99m };
            var results = ValidateModel(item);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void InjectionStringInItemNameValidatesIfWithinLength()
        {
            var injection = "'; DROP TABLE Items; --";
            var item = new Item { Id = 1, ItemName = injection, SubcategoryId = 1, Stock = 10, Price = 10.99m };
            var results = ValidateModel(item);
            Assert.AreEqual(0, results.Count);
        }
    }

    [TestFixture]
    public class ListingTests
    {
        private IList<ValidationResult> ValidateModel(object model)
        {
            var context = new ValidationContext(model);
            var results = new List<ValidationResult>();
            Validator.TryValidateObject(model, context, results, true);
            return results;
        }

        [Test]
        public void ValidListingPassesValidation()
        {
            var listing = new Listing { Id = 1, ItemName = "Listing Item", Quantity = 1, Price = 9.99m, UserId = "User1" };
            var results = ValidateModel(listing);
            Assert.AreEqual(0, results.Count);
            Assert.LessOrEqual((DateTime.UtcNow - listing.CreatedAt).TotalSeconds, 5);
        }

        [Test]
        public void EmptyItemNameFailsValidation()
        {
            var listing = new Listing { Id = 1, ItemName = "", Quantity = 1, Price = 9.99m, UserId = "User1" };
            var results = ValidateModel(listing);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void InvalidQuantityFailsValidation()
        {
            var listing = new Listing { Id = 1, ItemName = "Listing", Quantity = 0, Price = 9.99m, UserId = "User1" };
            var results = ValidateModel(listing);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void InvalidPriceFailsValidation()
        {
            var listing = new Listing { Id = 1, ItemName = "Listing", Quantity = 1, Price = 0, UserId = "User1" };
            var results = ValidateModel(listing);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void InjectionStringInUserIdValidatesIfWithinLength()
        {
            var injection = "'; DROP TABLE Users; --";
            var listing = new Listing { Id = 1, ItemName = "Listing", Quantity = 1, Price = 9.99m, UserId = injection };
            var results = ValidateModel(listing);
            Assert.AreEqual(0, results.Count);
        }
    }

    [TestFixture]
    public class UserTests
    {
        private IList<ValidationResult> ValidateModel(object model)
        {
            var context = new ValidationContext(model);
            var results = new List<ValidationResult>();
            Validator.TryValidateObject(model, context, results, true);
            return results;
        }

        [Test]
        public void DefaultUserFailsValidationDueToEmptyName()
        {
            var user = new User { UserName = "TestUser" };
            var results = ValidateModel(user);
            Assert.Greater(results.Count, 0);
        }

        [Test]
        public void ValidUserPassesValidation()
        {
            var user = new User { UserName = "TestUser", Name = "Test Name", Role = "Client" };
            var results = ValidateModel(user);
            Assert.AreEqual(0, results.Count);
        }

        [Test]
        public void OverlyLongNameFailsValidation()
        {
            var longName = new string('a', 101);
            var user = new User { UserName = "TestUser", Name = longName, Role = "Client" };
            var results = ValidateModel(user);
            Assert.Greater(results.Count, 0);
        }
    }
}

