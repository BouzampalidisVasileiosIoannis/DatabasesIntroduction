import pandas as pd

def filter_rows(file1, file2,file3):

    df1 = pd.read_csv(file1)
    df2 = pd.read_csv(file2)


    df2_filtered = df2[df2['PLAYER_ID'].isin(df1['PLAYER_ID'])]
    df2_filtered.dropna(subset=['MIN', 'REB', 'AST', 'STL', 'BLK', 'PTS'], inplace=True)

    
    df2_filtered.to_csv(file3, index=False)

if __name__ == "__main__":
    file1_path = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/players.csv"  
    file2_path = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/games_detail.csv"  
    file3_path = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/result.csv"

    filter_rows(file1_path, file2_path, file3_path)
