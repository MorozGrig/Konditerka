using Konditerka.AppData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Konditerka.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageOutput.xaml
    /// </summary>
    public partial class PageOutput : Page
    {
        public PageOutput()
        {
            InitializeComponent();
            ListProducts.ItemsSource = AppConnect.model0db.Catalogs.ToList();
            Fill();
        }

        public void Fill()
        {
            ComboSort.Items.Add("Цена");
            ComboSort.Items.Add("По возрастанию цены");
            ComboSort.Items.Add("По убыванию цены");
            ComboSort.SelectedIndex = 0;
            ComboFilter.SelectedIndex = 0;
            var category = AppConnect.model0db.Categories;
            ComboFilter.Items.Add("Категория");
            foreach (var item in category)
            {
                ComboFilter.Items.Add(item.NameCategory);
            }
        }

        Catalogs[] CatalogsList()
        {
            try
            {
                List<Catalogs> catalogs = AppConnect.model0db.Catalogs.ToList();
                if (TextSearch != null)
                {
                    catalogs = catalogs.Where(x => x.Product.ToLower().Contains(TextSearch.Text.ToLower())).ToList();
                }

                if (ComboFilter.SelectedIndex > 0)
                {
                    switch (ComboFilter.SelectedIndex)
                    {
                        case 1:
                            catalogs = catalogs.Where(x => x.IdCategory == 1).ToList();
                            break;
                        case 2:
                            catalogs = catalogs.Where(x => x.IdCategory == 2).ToList();
                            break;
                        case 3:
                            catalogs = catalogs.Where(x => x.IdCategory == 3).ToList();
                            break;
                        case 4:
                            catalogs = catalogs.Where(x => x.IdCategory == 4).ToList();
                            break;
                    }
                }
                if (ComboSort.SelectedIndex > 0)
                {
                    switch (ComboSort.SelectedIndex)
                    {
                        case 1:
                            catalogs = catalogs.OrderBy(x => x.Price).ToList();
                            break;
                        case 2:
                            catalogs = catalogs.OrderByDescending(x => x.Price).ToList();
                            break;
                    }
                }
                if (catalogs.Count > 0)
                {
                    tbCounter.Text = "Найдено " + catalogs.Count + " рец.";
                }
                else
                {
                    tbCounter.Text = "Не найдено";
                }
                return catalogs.ToArray();
            }
            catch
            {
                MessageBox.Show("Повтори попытку позже");
                return null;
            }
        }

        private void ComboFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListProducts.ItemsSource = CatalogsList();
        }

        private void ComboSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListProducts.ItemsSource = CatalogsList();
        }

        private void TextSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            ListProducts.ItemsSource = CatalogsList();
        }

        private void AddProductsButton_Click(object sender, RoutedEventArgs e)
        {
            //AppFrame.framemain.Navigate(new AddProductPage());
        }

        private void AddProductsButton_Loaded(object sender, RoutedEventArgs e)
        {
            if (!AppData.CurrentUser.IsAdmin)
            {
                AddProductsButton.Visibility = Visibility.Hidden;
                AddProductsButton.IsEnabled = false;
            }
        }
    }
}
