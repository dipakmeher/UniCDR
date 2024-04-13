def extract_percentage_of_data(file_path, output_path, percentage):
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()
    
    # Calculate the number of lines corresponding to the specified percentage
    percentage_count = max(1, int(len(lines) * (percentage / 100.0)))
    
    # Select lines spread out evenly through the file
    selected_lines = [lines[i] for i in range(0, len(lines), len(lines) // percentage_count)]
    
    # Write the selected lines to the output file
    with open(output_path, 'w', encoding='utf-8') as output_file:
        output_file.writelines(selected_lines)

# Example usage
input_file_path = '/scratch/dmeher/UniCDR/llmdataset/dual-user-inter/dataset/music_movie/train.txt'  # Replace with your input file path
output_file_path = '/scratch/dmeher/UniCDR/llmdataset/dual-user-inter/dataset/music_movie/valid.txt'  # Output file path
percentage = 1.7
extract_percentage_of_data(input_file_path, output_file_path,percentage)

