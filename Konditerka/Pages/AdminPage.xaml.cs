using System.Windows;
using System.Windows.Controls;

namespace Konditerka.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
            AdminContentFrame.Navigate(new ProductsAdminPage());
        }

        private void ProductsButton_Click(object sender, RoutedEventArgs e)
        {
            AdminContentFrame.Navigate(new ProductsAdminPage());
        }

        private void CategoriesButton_Click(object sender, RoutedEventArgs e)
        {
            AdminContentFrame.Navigate(new CategoriesAdminPage());
        }

        private void OrdersButton_Click(object sender, RoutedEventArgs e)
        {
            AdminContentFrame.Navigate(new OrdersAdminPage());
        }

        private void UsersButton_Click(object sender, RoutedEventArgs e)
        {
            AdminContentFrame.Navigate(new UsersAdminPage());
        }

        private void EmployeesButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Раздел сотрудников будет добавлен позже.", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void SuppliesButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Раздел поставок и ингредиентов будет добавлен позже.", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
