using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DriveUrselfProducts
{
    /// <summary>
    /// Логика взаимодействия для MainMenu.xaml
    /// </summary>
    public partial class MainMenu : Window
    {
        private double rowPos = 0;
        private double collumnPos = 0;

        private DriveUrselfProductsDBEntities1 dup;

        public MainMenu()
        {
            InitializeComponent();

            dup = new DriveUrselfProductsDBEntities1();

            int i = 0;
            foreach (var product in dup.product)
            {
                i++;
                Image img = new Image();
                img.Width = 100;
                img.Height = 100;
                img.Source = new BitmapImage(new Uri(@"pack://siteoforigin:,,,/" + product.C_Главное_изображение));
                img.Name = "id_" + product.id.ToString();
                img.MouseLeftButtonDown += Image_MouseLeftButtonDown;

                Label lbl = new Label();
                lbl.Content = product.Наименование_товара.Substring(0, 20) + "...: " + product.C_Цена;


                grid.Height += 100;
                grid.Children.Add(img);
                grid.Children.Add(lbl);


                Canvas.SetTop(img, rowPos);
                Canvas.SetLeft(img, collumnPos);
                Canvas.SetTop(lbl, rowPos + img.Height);
                Canvas.SetLeft(lbl, collumnPos);

                if (i % 3 != 0)
                {

                    collumnPos += 250;
                }
                else
                {
                    rowPos += 150;
                    collumnPos = 0;
                }
            }
        }

        private void Test_Click(object sender, RoutedEventArgs e)
        {
            int i = 0;
            foreach (var product in dup.product)
            {
                i++;
                Image img = new Image();
                img.Width = 100;
                img.Height = 100;
                img.Source = new BitmapImage(new Uri(@"pack://siteoforigin:,,,/" + product.C_Главное_изображение));
                img.Name = "id_" + product.id.ToString();
                img.MouseLeftButtonDown += Image_MouseLeftButtonDown;

                Label lbl = new Label();
                lbl.Content = product.Наименование_товара.Substring(0, 20) + "...: " + product.C_Цена;


                grid.Height += 100;
                grid.Children.Add(img);
                grid.Children.Add(lbl);


                Canvas.SetTop(img, rowPos);
                Canvas.SetLeft(img, collumnPos);
                Canvas.SetTop(lbl, rowPos + img.Height);
                Canvas.SetLeft(lbl, collumnPos);

                if (i % 3 != 0)
                {

                    collumnPos += 250;
                }
                else
                {
                    rowPos += 150;
                    collumnPos = 0;
                }
            }
        }

        private void Image_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {         
            SelectedProduct product = new SelectedProduct((sender as Image).Name);

            product.Show();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
