// --- FILE: Vendorscreen.tsx ---
import React, { useState, useCallback } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, SafeAreaView, ScrollView } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

interface sectionProps {
  title: string;
  isCompleted?: boolean;
  isExpanded: boolean;
  onToggle: () => void;
  onPress?: () => void;
  children?: React.ReactNode;
}

const sectionComponent: React.FC<sectionProps> = ({
  title,
  isCompleted,
  isExpanded,
  onToggle,
  onPress,
  children
}) => {
  const handleSectionPress = useCallback(() => {
    if (onPress) {
      onPress();
    } else {
      onToggle();
    }
  }, [onPress, onToggle]);

  return (
    <View style={styles.sectionContainer}>
      <TouchableOpacity onPress={handleSectionPress} style={styles.sectionHeader}>
        <View style={styles.sectionTitleContainer}>
          {isCompleted !== undefined && (
            <View style={[styles.iconContainer, isCompleted ? styles.completedIcon : styles.pendingIcon]}>
              {isCompleted ? 
                <Icon name="checkmark" size={16} color="#fff" /> : 
                <Icon name="information" size={16} color="#fff" />
              }
            </View>
          )}
          <Text style={styles.sectionTitle}>{title}</Text>
        </View>
        <Icon 
          name={onPress ? "chevron-forward" : (isExpanded ? "chevron-up" : "chevron-down")} 
          size={24} 
          color="#888"
        />
      </TouchableOpacity>
      {isExpanded && children && <View style={styles.sectionContent}>{children}</View>}
    </View>
  );
};

const sectionItemComponent: React.FC<{
  title: string;
  onPress: () => void;
}> = ({ title, onPress }) => {
  return (
    <TouchableOpacity onPress={onPress} style={styles.sectionItem}>
      <View style={styles.sectionItemLeft}>
        <View style={styles.infoIconContainer}>
          <Icon name="information" size={16} color="#fff" />
        </View>
        <Text style={styles.sectionItemText}>{title}</Text>
      </View>
      <Icon name="chevron-forward" size={24} color="#888" />
    </TouchableOpacity>
  );
};

const Vendorscreen: React.FC = () => {
  const [expandedSections, setExpandedSections] = useState({
    organisation: true,
    factoryDetails: false,
    productCapacity: false,
    financialInfo: false
  });
  
  const [termsAccepted, setTermsAccepted] = useState(true);

  const handleToggleSection = useCallback((section: keyof typeof expandedSections) => {
    setExpandedSections(prev => ({
      ...prev,
      [section]: !prev[section]
    }));
  }, []);

  const handleNavigateToSection = useCallback((section: string) => {
    try {
      console.log(`Navigating to ${section}`);
      // Navigation logic would go here
    } catch (error) {
      console.error(`Error navigating to ${section}:`, error);
    }
  }, []);

  const handleSubmitForReview = useCallback(() => {
    try {
      console.log('Submitting for review');
      // Submission logic would go here
    } catch (error) {
      console.error('Error submitting for review:', error);
    }
  }, []);

  const handleToggleTerms = useCallback(() => {
    setTermsAccepted(prev => !prev);
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <TouchableOpacity style={styles.menuButton}>
          <Icon name="menu" size={28} color="#fff" />
        </TouchableOpacity>
        <Text style={styles.headerTitle}>Vendor Onboarding</Text>
      </View>
      
      <ScrollView style={styles.content}>
        <sectionComponent
          title="Organisation"
          isExpanded={expandedSections.organisation}
          onToggle={() => handleToggleSection('organisation')}
        >
          <View style={styles.subsectionList}>
            <TouchableOpacity style={styles.subsectionItem}>
              <View style={styles.subsectionItemLeft}>
                <View style={styles.completedIcon}>
                  <Icon name="checkmark" size={16} color="#fff" />
                </View>
                <Text style={styles.subsectionItemText}>Primary Info</Text>
              </View>
            </TouchableOpacity>
            
            <sectionItemComponent 
              title="Contact Info"
              onPress={() => handleNavigateToSection('contactInfo')}
            />
            
            <sectionItemComponent 
              title="Workplace & Workforce Info"
              onPress={() => handleNavigateToSection('workplaceInfo')}
            />
            
            <sectionItemComponent 
              title="Quality Assurance Info"
              onPress={() => handleNavigateToSection('qualityInfo')}
            />
            
            <sectionItemComponent 
              title="Bank Details"
              onPress={() => handleNavigateToSection('bankDetails')}
            />
            
            <sectionItemComponent 
              title="Sub Vendors Details"
              onPress={() => handleNavigateToSection('subVendors')}
            />
            
            <sectionItemComponent 
              title="Additional Information"
              onPress={() => handleNavigateToSection('additionalInfo')}
            />
          </View>
        </sectionComponent>
        
        <sectionComponent
          title="Factory Details"
          isExpanded={expandedSections.factoryDetails}
          onToggle={() => handleToggleSection('factoryDetails')}
        />
        
        <sectionComponent
          title="Product Capacity"
          isExpanded={expandedSections.productCapacity}
          onToggle={() => handleToggleSection('productCapacity')}
        />
        
        <sectionComponent
          title="Financial Info"
          isExpanded={expandedSections.financialInfo}
          onToggle={() => handleToggleSection('financialInfo')}
        />
        
        <TouchableOpacity 
          style={styles.termsContainer}
          onPress={handleToggleTerms}
        >
          <View style={[
            styles.checkboxContainer, 
            termsAccepted ? styles.acceptedCheckbox : styles.uncheckedCheckbox
          ]}>
            {termsAccepted && <Icon name="checkmark" size={18} color="#fff" />}
          </View>
          <Text style={styles.termsText}>Terms & Conditions</Text>
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.submitButton}
          onPress={handleSubmitForReview}
        >
          <Text style={styles.submitButtonText}>Submit for Review</Text>
        </TouchableOpacity>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f0f0f0',
  },
  header: {
    backgroundColor: '#dd4b39',
    height: 60,
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 15,
  },
  menuButton: {
    padding: 5,
  },
  headerTitle: {
    color: '#fff',
    fontSize: 20,
    fontWeight: '500',
    marginLeft: 15,
  },
  content: {
    flex: 1,
    padding: 15,
  },
  sectionContainer: {
    backgroundColor: '#fff',
    borderRadius: 8,
    marginBottom: 15,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 15,
  },
  sectionTitleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  sectionTitle: {
    fontSize: 18,
    color: '#333',
    fontWeight: '500',
  },
  iconContainer: {
    width: 24,
    height: 24,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  completedIcon: {
    backgroundColor: '#4CAF50',
    width: 24,
    height: 24,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  pendingIcon: {
    backgroundColor: '#FFA07A',
    width: 24,
    height: 24,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  infoIconContainer: {
    backgroundColor: '#FFA07A',
    width: 24,
    height: 24,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  sectionContent: {
    paddingBottom: 10,
  },
  subsectionList: {
    borderTopWidth: 1,
    borderTopColor: '#eee',
  },
  subsectionItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
  },
  subsectionItemLeft: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  subsectionItemText: {
    fontSize: 16,
    color: '#444',
  },
  sectionItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 15,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
  },
  sectionItemLeft: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  sectionItemText: {
    fontSize: 16,
    color: '#444',
  },
  termsContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 20,
  },
  checkboxContainer: {
    width: 24,
    height: 24,
    borderRadius: 4,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  acceptedCheckbox: {
    backgroundColor: '#dd4b39',
  },
  uncheckedCheckbox: {
    backgroundColor: 'transparent',
    borderWidth: 1,
    borderColor: '#dd4b39',
  },
  termsText: {
    fontSize: 16,
    color: '#555',
  },
  submitButton: {
    backgroundColor: '#dd4b39',
    padding: 15,
    borderRadius: 8,
    alignItems: 'center',
    marginBottom: 20,
  },
  submitButtonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '500',
  },
});

export default Vendorscreen;
// --- END FILE ---