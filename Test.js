import React, { useState } from 'react';
import {
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Collapse,
  Button,
  Box,
  Container,
} from '@mui/material';
import {
  Menu as MenuIcon,
  ExpandMore,
  ExpandLess,
  CheckCircle,
  Info,
  ChevronRight,
} from '@mui/icons-material';

const Test = () => {
  const [OrganisationExpanded, SetOrganisationExpanded] = useState(true);
  const [FactoryDetailsExpanded, SetFactoryDetailsExpanded] = useState(false);
  const [ProductCapacityExpanded, SetProductCapacityExpanded] = useState(false);
  const [FinancialInfoExpanded, SetFinancialInfoExpanded] = useState(false);

  const HandleToggleOrganisation = () => {
    SetOrganisationExpanded(!OrganisationExpanded);
  };

  const HandleToggleFactoryDetails = () => {
    SetFactoryDetailsExpanded(!FactoryDetailsExpanded);
  };

  const HandleToggleProductCapacity = () => {
    SetProductCapacityExpanded(!ProductCapacityExpanded);
  };

  const HandleToggleFinancialInfo = () => {
    SetFinancialInfoExpanded(!FinancialInfoExpanded);
  };

  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static" sx={{ backgroundColor: '#dd4b39' }}>
        <Toolbar>
          <IconButton
            size="large"
            edge="start"
            color="inherit"
            aria-label="menu"
            sx={{ mr: 2 }}
          >
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            Vendor Onboarding
          </Typography>
        </Toolbar>
      </AppBar>
      <Container maxWidth="sm" sx={{ mt: 2 }}>
        <List component="nav" aria-labelledby="nested-list-subheader">
          <ListItem button onClick={HandleToggleOrganisation}>
            <ListItemText primary="Organisation" />
            {OrganisationExpanded ? <ExpandLess /> : <ExpandMore />}
          </ListItem>
          <Collapse in={OrganisationExpanded} timeout="auto" unmountOnExit>
            <List component="div" disablePadding>
              <ListItem>
                <ListItemIcon>
                  <CheckCircle color="success" />
                </ListItemIcon>
                <ListItemText primary="Primary Info" />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Contact Info" />
                <ChevronRight />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Workplace & Workforce Info" />
                <ChevronRight />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Quality Assurance Info" />
                <ChevronRight />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Bank Details" />
                <ChevronRight />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Sub Vendors Details" />
                <ChevronRight />
              </ListItem>
              <ListItem button>
                <ListItemIcon>
                  <Info sx={{ color: '#ffccbc' }} />
                </ListItemIcon>
                <ListItemText primary="Additional Information" />
                <ChevronRight />
              </ListItem>
            </List>
          </Collapse>
          <ListItem button onClick={HandleToggleFactoryDetails}>
            <ListItemText primary="Factory Details" />
            {FactoryDetailsExpanded ? <ExpandLess /> : <ExpandMore />}
          </ListItem>
          <ListItem button onClick={HandleToggleProductCapacity}>
            <ListItemText primary="Product Capacity" />
            {ProductCapacityExpanded ? <ExpandLess /> : <ExpandMore />}
          </ListItem>
          <ListItem button onClick={HandleToggleFinancialInfo}>
            <ListItemText primary="Financial Info" />
            {FinancialInfoExpanded ? <ExpandLess /> : <ExpandMore />}
          </ListItem>
        </List>
        <Box sx={{ mt: 2, mb: 2 }}>
          <Typography variant="body1" sx={{ display: 'flex', alignItems: 'center' }}>
            <CheckCircle sx={{ color: '#dd4b39', mr: 1 }} />
            Terms & Conditions
          </Typography>
        </Box>
        <Button
          variant="contained"
          fullWidth
          sx={{
            backgroundColor: '#dd4b39',
            '&:hover': {
              backgroundColor: '#c53929',
            },
          }}
        >
          Submit for Review
        </Button>
      </Container>
    </Box>
  );
};

export default Test;