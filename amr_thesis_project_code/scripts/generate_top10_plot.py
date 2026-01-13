import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os

# Define paths
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
data_path = os.path.join(base_dir, 'data', 'processed', 'figures', 'coresistance_significant_pairs.csv')
output_path = os.path.join(base_dir, 'data', 'processed', 'figures', 'top_10_coresistance_pairs.png')

print(f"Loading data from: {data_path}")

if os.path.exists(data_path):
    pairs_df = pd.read_csv(data_path)
    
    # Sort by Phi descending just in case, though app takes head(10) assuming semblance of order
    # The app code just took head(10). Let's verify if we need sorting. 
    # Usually significant_pairs.csv is likely sorted.
    # Let's clean it up specifically for the plot.
    
    top_pairs = pairs_df.head(10).copy()
    top_pairs['Pair'] = top_pairs['Antibiotic_1'] + ' - ' + top_pairs['Antibiotic_2']
    
    # Create the plot
    plt.rcParams['figure.facecolor'] = 'white'
    plt.rcParams['axes.facecolor'] = 'white'
    plt.rcParams['axes.edgecolor'] = 'black'
    plt.rcParams['text.color'] = 'black'
    plt.rcParams['axes.labelcolor'] = 'black'
    plt.rcParams['xtick.color'] = 'black'
    plt.rcParams['ytick.color'] = 'black'
    
    fig, ax = plt.subplots(figsize=(8, 5))
    fig.patch.set_facecolor('white')
    ax.set_facecolor('white')
    
    # Color scheme from app
    colors = plt.cm.Reds(np.linspace(0.4, 0.9, len(top_pairs)))[::-1]
    
    # Horizontal bar chart
    ax.barh(top_pairs['Pair'], top_pairs['Phi'], color=colors, edgecolor='black')
    
    ax.set_xlabel('Phi Coefficient (Association Strength)')
    ax.set_ylabel('Antibiotic Pair')
    ax.set_title('Strongest Co-Resistance Associations')
    
    # Invert y-axis to have top pair at the top
    ax.invert_yaxis()
    
    plt.tight_layout()
    
    # Save high-res figure
    print(f"Saving figure to: {output_path}")
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    print("Done.")
else:
    print("Error: Data file not found.")
