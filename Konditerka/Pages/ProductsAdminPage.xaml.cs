using Konditerka.AppData;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Konditerka.Pages
{
    public partial class ProductsAdminPage : Page
    {
        private Catalogs _selectedProduct;

        public ProductsAdminPage()
        {
            InitializeComponent();
            CategoryBox.ItemsSource = AppConnect.model0db.Categories.ToList();
            RefreshData();
        }

        private void RefreshData()
        {
            ProductsGrid.ItemsSource = AppConnect.model0db.Catalogs.ToList();
            ProductsGrid.SelectedItem = null;
            ClearForm();
        }

        private void ClearForm()
        {
            _selectedProduct = null;
            ProductNameBox.Text = string.Empty;
            CategoryBox.SelectedIndex = -1;
            PriceBox.Text = string.Empty;
            DescriptionBox.Text = string.Empty;
            PhotoPathBox.Text = string.Empty;
        }

        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(ProductNameBox.Text))
            {
                MessageBox.Show("Введите название товара");
                return false;
            }

            if (CategoryBox.SelectedValue == null)
            {
                MessageBox.Show("Выберите категорию");
                return false;
            }

            if (!decimal.TryParse(PriceBox.Text, out var price) || price <= 0)
            {
                MessageBox.Show("Цена должна быть больше 0");
                return false;
            }

            return true;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateForm())
            {
                return;
            }

            var newProduct = new Catalogs
            {
                Product = ProductNameBox.Text.Trim(),
                IdCategory = (int)CategoryBox.SelectedValue,
                Price = decimal.Parse(PriceBox.Text),
                Descripton = DescriptionBox.Text.Trim(),
                PhotoPath = PhotoPathBox.Text.Trim()
            };

            AppConnect.model0db.Catalogs.Add(newProduct);
            AppConnect.model0db.SaveChanges();
            RefreshData();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (_selectedProduct == null)
            {
                MessageBox.Show("Выберите товар для редактирования");
                return;
            }

            if (!ValidateForm())
            {
                return;
            }

            _selectedProduct.Product = ProductNameBox.Text.Trim();
            _selectedProduct.IdCategory = (int)CategoryBox.SelectedValue;
            _selectedProduct.Price = decimal.Parse(PriceBox.Text);
            _selectedProduct.Descripton = DescriptionBox.Text.Trim();
            _selectedProduct.PhotoPath = PhotoPathBox.Text.Trim();

            AppConnect.model0db.SaveChanges();
            RefreshData();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (_selectedProduct == null)
            {
                MessageBox.Show("Выберите товар для удаления");
                return;
            }

            var result = MessageBox.Show("Удалить выбранный товар?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result != MessageBoxResult.Yes)
            {
                return;
            }

            AppConnect.model0db.Catalogs.Remove(_selectedProduct);
            AppConnect.model0db.SaveChanges();
            RefreshData();
        }

        private void RefreshButton_Click(object sender, RoutedEventArgs e)
        {
            RefreshData();
        }

        private void ProductsGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _selectedProduct = ProductsGrid.SelectedItem as Catalogs;
            if (_selectedProduct == null)
            {
                return;
            }

            ProductNameBox.Text = _selectedProduct.Product;
            CategoryBox.SelectedValue = _selectedProduct.IdCategory;
            PriceBox.Text = _selectedProduct.Price.ToString();
            DescriptionBox.Text = _selectedProduct.Descripton;
            PhotoPathBox.Text = _selectedProduct.PhotoPath;
        }
    }
}
