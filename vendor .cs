```csharp
using System;
using System.Collections.Generic;
using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics;

namespace VendorOnboardingApp
{
    public class vendor : ContentPage
    {
        private bool termsAccepted = false;

        public vendor()
        {
            Title = "Vendor Onboarding";
            BackgroundColor = Colors.White;

            var organisationSection = CreateAccordionSection("Organisation", true, CreateOrganisationItems());
            var factoryDetailsSection = CreateAccordionSection("Factory Details", false, null);
            var productCapacitySection = CreateAccordionSection("Product Capacity", false, null);
            var financialInfoSection = CreateAccordionSection("Financial Info", false, null);

            var termsCheckbox = new CheckBox
            {
                Color = Color.FromArgb("#e25532"),
                IsChecked = termsAccepted
            };
            termsCheckbox.CheckedChanged += (s, e) => termsAccepted = termsCheckbox.IsChecked;

            var termsLabel = new Label
            {
                Text = "Terms & Conditions",
                FontSize = 16,
                TextColor = Color.FromArgb("#666666"),
                VerticalOptions = LayoutOptions.Center,
                Margin = new Thickness(10, 0, 0, 0)
            };

            var termsStack = new StackLayout
            {
                Orientation = StackOrientation.Horizontal,
                HorizontalOptions = LayoutOptions.Center,
                Margin = new Thickness(0, 20, 0, 20),
                Children = { termsCheckbox, termsLabel }
            };

            var submitButton = new Button
            {
                Text = "Submit for Review",
                BackgroundColor = Color.FromArgb("#e25532"),
                TextColor = Colors.White,
                FontAttributes = FontAttributes.Bold,
                CornerRadius = 5,
                Margin = new Thickness(20, 0, 20, 20),
                HeightRequest = 50
            };

            Content = new StackLayout
            {
                Children = {
                    organisationSection,
                    factoryDetailsSection,
                    productCapacitySection,
                    financialInfoSection,
                    termsStack,
                    submitButton
                }
            };

            // Add header toolbar with hamburger menu
            NavigationPage.SetHasNavigationBar(this, false);
            
            var menuIcon = new Image
            {
                Source = "hamburger_menu.png",
                HeightRequest = 24,
                WidthRequest = 24
            };

            var menuButton = new ImageButton
            {
                Source = "hamburger_menu.png",
                HeightRequest = 24,
                WidthRequest = 24,
                BackgroundColor = Colors.Transparent,
                Padding = new Thickness(10)
            };

            var titleLabel = new Label
            {
                Text = "Vendor Onboarding",
                TextColor = Colors.White,
                FontSize = 20,
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };

            var toolbarContent = new Grid
            {
                ColumnDefinitions =
                {
                    new ColumnDefinition { Width = GridLength.Auto },
                    new ColumnDefinition { Width = GridLength.Star },
                    new ColumnDefinition { Width = GridLength.Auto }
                },
                BackgroundColor = Color.FromArgb("#e25532"),
                HeightRequest = 60,
                Padding = new Thickness(10, 0)
            };

            toolbarContent.Add(menuButton, 0, 0);
            toolbarContent.Add(titleLabel, 1, 0);

            // Add the toolbar to the top of the content
            var mainLayout = new Grid
            {
                RowDefinitions =
                {
                    new RowDefinition { Height = GridLength.Auto },
                    new RowDefinition { Height = GridLength.Star }
                }
            };

            mainLayout.Add(toolbarContent, 0, 0);
            
            var contentScrollView = new ScrollView
            {
                Content = Content
            };
            
            mainLayout.Add(contentScrollView, 0, 1);
            
            Content = mainLayout;
        }

        private Frame CreateAccordionSection(string title, bool isExpanded, StackLayout content)
        {
            var headerLabel = new Label
            {
                Text = title,
                FontSize = 18,
                TextColor = Color.FromArgb("#666666"),
                VerticalOptions = LayoutOptions.Center
            };

            var chevronImage = new Image
            {
                Source = isExpanded ? "chevron_up.png" : "chevron_down.png",
                HeightRequest = 24,
                WidthRequest = 24,
                HorizontalOptions = LayoutOptions.End,
                VerticalOptions = LayoutOptions.Center
            };

            var headerGrid = new Grid
            {
                ColumnDefinitions =
                {
                    new ColumnDefinition { Width = GridLength.Star },
                    new ColumnDefinition { Width = GridLength.Auto }
                },
                Padding = new Thickness(15, 10)
            };

            headerGrid.Add(headerLabel, 0, 0);
            headerGrid.Add(chevronImage, 1, 0);

            var headerTapGesture = new TapGestureRecognizer();
            headerGrid.GestureRecognizers.Add(headerTapGesture);

            var mainStack = new StackLayout();
            mainStack.Add(headerGrid);
            
            if (isExpanded && content != null)
            {
                mainStack.Add(content);
            }

            var frame = new Frame
            {
                Content = mainStack,
                Padding = new Thickness(0),
                Margin = new Thickness(20, 10),
                CornerRadius = 10,
                HasShadow = false,
                BorderColor = Color.FromArgb("#EEEEEE")
            };

            headerTapGesture.Tapped += (s, e) =>
            {
                isExpanded = !isExpanded;
                chevronImage.Source = isExpanded ? "chevron_up.png" : "chevron_down.png";
                
                if (isExpanded && content != null)
                {
                    if (!mainStack.Children.Contains(content))
                    {
                        mainStack.Add(content);
                    }
                }
                else
                {
                    if (content != null && mainStack.Children.Contains(content))
                    {
                        mainStack.Remove(content);
                    }
                }
            };

            return frame;
        }

        private StackLayout CreateOrganisationItems()
        {
            var stack = new StackLayout();

            // Create the list items
            var items = new List<(string Title, string IconName, bool IsCompleted, bool HasChevron)>
            {
                ("Primary Info", "info_circle", true, false),
                ("Contact Info", "info_circle", false, true),
                ("Workplace & Workforce Info", "info_circle", false, true),
                ("Quality Assurance Info", "info_circle", false, true),
                ("Bank Details", "info_circle", false, true),
                ("Sub Vendors Details", "info_circle", false, true),
                ("Additional Information", "info_circle", false, true)
            };

            foreach (var item in items)
            {
                stack.Add(CreateListItem(item.Title, item.IconName, item.IsCompleted, item.HasChevron));
            }

            return stack;
        }

        private Frame CreateListItem(string title, string iconName, bool completed, bool hasChevron)
        {
            Color circleColor = completed ? Color.FromArgb("#66BB6A") : Color.FromArgb("#F8D0C2");
            string iconText = completed ? "✓" : "i";

            var iconLabel = new Label
            {
                Text = iconText,
                TextColor = completed ? Colors.White : Color.FromArgb("#e25532"),
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center,
                FontSize = 14,
                FontAttributes = FontAttributes.Bold
            };

            var iconCircle = new Frame
            {
                Content = iconLabel,
                WidthRequest = 30,
                HeightRequest = 30,
                CornerRadius = 15,
                Padding = new Thickness(0),
                HasShadow = false,
                BackgroundColor = circleColor,
                HorizontalOptions = LayoutOptions.Start,
                VerticalOptions = LayoutOptions.Center
            };

            var titleLabel = new Label
            {
                Text = title,
                TextColor = Color.FromArgb("#666666"),
                FontSize = 16,
                VerticalOptions = LayoutOptions.Center,
                Margin = new Thickness(10, 0, 0, 0)
            };

            var chevron = hasChevron ? new Image
            {
                Source = "chevron_right.png",
                HeightRequest = 20,
                WidthRequest = 20,
                HorizontalOptions = LayoutOptions.End,
                VerticalOptions = LayoutOptions.Center
            } : null;

            var grid = new Grid
            {
                ColumnDefinitions =
                {
                    new ColumnDefinition { Width = GridLength.Auto },
                    new ColumnDefinition { Width = GridLength.Star },
                    new ColumnDefinition { Width = GridLength.Auto }
                },
                Padding = new Thickness(15, 10)
            };

            grid.Add(iconCircle, 0, 0);
            grid.Add(titleLabel, 1, 0);
            if (chevron != null)
            {
                grid.Add(chevron, 2, 0);
            }

            var tapGesture = new TapGestureRecognizer();
            grid.GestureRecognizers.Add(tapGesture);

            var separator = new BoxView
            {
                HeightRequest = 1,
                Color = Color.FromArgb("#EEEEEE"),
                HorizontalOptions = LayoutOptions.FillAndExpand
            };

            var stack = new StackLayout
            {
                Children = { grid, separator }
            };

            return new Frame
            {
                Content = stack,
                Padding = new Thickness(0),
                CornerRadius = 0,
                HasShadow = false,
                BorderColor = Colors.Transparent
            };
        }
    }
}
```