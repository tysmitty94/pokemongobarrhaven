﻿<%@ Page Title="Pokédex" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pokedex.aspx.cs" Inherits="ProjectMeowth.Pokedex" %>

<asp:Content ID="HeaderPokedex" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .grid-item { /*width: 25%;*/ background-color: lightblue; }
        
    </style>
</asp:Content>

<asp:Content ID="BodyContentPokedex" ContentPlaceHolderID="MainContent" runat="server">
    <h3>You have reached the - <%: Title %> page.</h3>

    <asp:Label ID="lblHi" runat="server"></asp:Label>
    
    <div class="container">
        <div id="btnFilters">
            <div class="btn-toolbar button-group filter-button-group" data-filter-group="region">
                <div class="btn-group btn-group-sm">

                    <!-- NOTE: You must NOT use the button tag here, since it triggers a postback in ASP.NET & resets the filter -->
                    <input type="button" class="btn btn-success" data-filter="*" value="Show All" />
                </div>
                <div class="btn-group btn-group-sm">
                    <input type="button" class="btn btn-success" data-filter=".Generation-1" value="Gen 1 - Kanto" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-2" value="Gen 2 - Johto" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-3" value="Gen 3 - Hoenn" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-4" value="Gen 4 - Sinnoh" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-5" value="Gen 5 - Unova" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-6" value="Gen 6 - Kalos" />
                    <input type="button" class="btn btn-success" data-filter=".Generation-7" value="Gen 7 - Alola" />
                </div>
            </div>

            <div style="padding-top: 1%"></div>

            <div class="btn-group btn-group-sm button-group" data-filter-group="type">

                <!-- NOTE: You must NOT use the button tag here, since it triggers a postback in ASP.NET & resets the filter -->
                <input type="button" class="btn btn-info" data-filter="*" value="Show All" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Normal" value = "Normal" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Fighting" value = "Fighting" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Flying" value = "Flying" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Poison" value = "Poison" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Ground" value = "Ground" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Rock" value = "Rock" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Bug" value = "Bug" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Ghost" value = "Ghost" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Steel" value = "Steel" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Fire" value = "Fire" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Water" value = "Water" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Grass" value = "Grass" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Electric" value = "Electric" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Psychic" value = "Psychic" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Ice" value = "Ice" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Dragon" value = "Dragon" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Dark" value = "Dark" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Fairy" value = "Fairy" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Unknown" value = "Unknown" />
                <input type="button" class="btn btn-info" data-filter=".PokemonType-Shadow" value = "Shadow" />
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="PokedexGrid" class="grid" runat="server">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
            
    </div>

    <script src="/Scripts/isotope.pkgd.min.js"></script>
    <script>

        // Initialize Isotope
        var $grid = $('.grid').isotope({

            // Specify options
            itemSelector: '.grid-item',
            layoutMode: 'fitRows'
        });

        ////// Filter Items on button click (single filter on page)
        ////$('.filter-button-group').on('click', 'input', function () {
        ////    console.log("Clicked button");
        ////    var filterValue = $(this).attr('data-filter');
        ////    $grid.isotope({ filter: filterValue });
        ////});

        // Store Filter for each group (multiple COMBINED filters on page)
        var filters = {};

        $('#btnFilters').on('click', 'input', function () {
            var $this = $(this);

            // Get group key
            var $buttonGroup = $this.parents('.button-group');
            var filterGroup = $buttonGroup.attr('data-filter-group');

            // Set filter for group
            filters[filterGroup] = $this.attr('data-filter');

            // Combine filters
            var filterValue = concatValues(filters);
            $grid.isotope({ filter: filterValue });
        });

        // Flatten object by concatenating values
        function concatValues(obj) {
            var value = '';
            for (var prop in obj) {
                value += obj[prop];
            }
            return value;
        }
    </script>
</asp:Content>

