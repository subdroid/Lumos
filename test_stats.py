import os
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.cm as cm
import matplotlib

plt.rcParams["figure.figsize"] = (15,10)

pwd = os.getcwd()

def plot_clustered_stacked(dfall, labels=None, title=None,  H="/", **kwargs):
    """Given a list of dataframes, with identical columns and index, create a clustered stacked bar plot. 
    labels is a list of the names of the dataframe, used for the legend
    title is a string for the title of the plot
    H is the hatch used for identification of the different dataframe"""

    n_df = len(dfall)
    n_col = len(dfall[0].columns) 
    n_ind = len(dfall[0].index)
    axe = plt.subplot(111)

    for df in dfall : # for each data frame
        axe = df.plot(kind="bar",
                      linewidth=0,
                      stacked=True,
                      ax=axe,
                      legend=True,
                      grid=False,
                      **kwargs)  # make bar plots
        # .patches is everything inside of the chart
        for rect in axe.patches:
            # Find where everything is located
            height = rect.get_height()
            width = rect.get_width()
            x = rect.get_x()
            y = rect.get_y()
            
            # The width of the bar is the data value and can used as the label
            label_text = f'{height:.2f}'  # f'{height:.2f}' if you have decimal values as labels
            
            label_x = x + width / 2
            label_y = y+0.5 + height+2 / 2
            # axe.text(label_x, label_y, label_text, ha='center', va='center', fontsize=8)


    h,l = axe.get_legend_handles_labels() # get the handles we want to modify
    
    for i in range(0, n_df * n_col, n_col): # len(h) = n_col * n_df
        for j, pa in enumerate(h[i:i+n_col]):
            for rect in pa.patches: # for each index
                rect.set_x(rect.get_x() + 1 / float(n_df + 1) * i / float(n_col))
                rect.set_hatch(H * int(i / n_col)) #edited part     
                rect.set_width(1 / float(n_df + 1))

    axe.set_xticks((np.arange(0, 2 * n_ind, 2) + 1 / float(n_df + 1)) / 2.)
    axe.set_xticklabels(df.index, rotation = 0)
    axe.set_title(title)

    # Add invisible data to add another legend
    n=[]        
    for i in range(n_df):
        n.append(axe.bar(0, 0, color="gray", hatch=H * i))

    l1 = axe.legend(h[:n_col], l[:n_col], loc=[1.01, 0.5])
    if labels is not None:
        l2 = plt.legend(n, labels, loc=[1.01, 0.1]) 
    axe.add_artist(l1)
    return axe

# scores = {}

# for files_ in os.listdir(pwd):
#     sen = []
#     hyp = []
#     if files_.split("_")[0]=="baseline":
    
#         contents = open(files_,"r").read().split("\n")
#         for lines in contents:
#             l_splits = lines.split("\t")
#             if l_splits[0].split("-")[0]=="S":
#                 s_ = (l_splits[1].split("|")[1]).strip()
#                 sen.append(s_)
#             if l_splits[0].split("-")[0]=="H":
#                 h_ = l_splits[2].strip()
#                 hyp.append(h_)
#         if len(sen)==len(hyp) and len(sen)==1000:
#             for s,h in zip(sen,hyp):
#                 score = 0
#                 for ind in range(len(s)):
#                     sent = s[ind]
#                     try:
#                         trg = h[ind]
#                         if sent==trg:
#                             score+=1
#                     except:
#                         continue
#                 ac_score = (score/len(s))*100
#                 if files_ in scores.keys():
#                     scores[str(files_)].append(ac_score)
#                 else:
#                     scores[str(files_)]=[ac_score]
# f_ = open("Baseline_Results","w")

# for key in scores.keys():
#     values = scores[key]
#     mv=np.mean(values)
#     print(f"{key}\t{mv}",file=f_)


# scores = {}

# for files_ in os.listdir(pwd):
#     sen = []
#     hyp = []
#     if files_.split("_")[0]=="perceiver": 
#         if files_.split("_")[1]=="tiny":
#             if os.path.isfile(files_):
#                 contents = open(files_,"r").read().split("\n")
#                 for lines in contents:
#                     l_splits = lines.split("\t")
#                     if l_splits[0].split("-")[0]=="S":
#                         s_ = (l_splits[1].split("|")[1]).strip()
#                         sen.append(s_)
#                     if l_splits[0].split("-")[0]=="H":
#                         h_ = l_splits[2].strip()
#                         hyp.append(h_)
#                 if len(sen)==len(hyp) and len(sen)==1000:
#                     for s,h in zip(sen,hyp):
#                         score = 0
#                         for ind in range(len(s)):
#                             sent = s[ind]
#                             try:
#                                 trg = h[ind]
#                                 if sent==trg:
#                                     score+=1
#                             except:
#                                 continue
#                         ac_score = (score/len(s))*100
#                         if files_ in scores.keys():
#                             scores[str(files_)].append(ac_score)
#                         else:
#                             scores[str(files_)]=[ac_score]
# f_ = open("Perceiver_tiny_Results","w")

# for key in scores.keys():
#     values = scores[key]
#     mv=np.mean(values)
#     print(f"{key}\t{mv}",file=f_)


# scores = {}

# for files_ in os.listdir(pwd):
#     sen = []
#     hyp = []
#     if files_.split("_")[0]=="perceiver": 
#         if files_.split("_")[1]=="deep":
#             if os.path.isfile(files_):
#                 contents = open(files_,"r").read().split("\n")
#                 for lines in contents:
#                     l_splits = lines.split("\t")
#                     if l_splits[0].split("-")[0]=="S":
#                         s_ = (l_splits[1].split("|")[1]).strip()
#                         sen.append(s_)
#                     if l_splits[0].split("-")[0]=="H":
#                         h_ = l_splits[2].strip()
#                         hyp.append(h_)
#                 if len(sen)==len(hyp) and len(sen)==1000:
#                     for s,h in zip(sen,hyp):
#                         score = 0
#                         for ind in range(len(s)):
#                             sent = s[ind]
#                             try:
#                                 trg = h[ind]
#                                 if sent==trg:
#                                     score+=1
#                             except:
#                                 continue
#                         ac_score = (score/len(s))*100
#                         if files_ in scores.keys():
#                             scores[str(files_)].append(ac_score)
#                         else:
#                             scores[str(files_)]=[ac_score]
# f_ = open("Perceiver_deep_Results","w")

# for key in scores.keys():
#     values = scores[key]
#     mv=np.mean(values)
#     print(f"{key}\t{mv}",file=f_)


f1_ = open("Perceiver_tiny_Results").read().split("\n")
f2_ = open("Baseline_Results").read().split("\n")
f3_ = open("Perceiver_deep_Results").read().split("\n")

tasks = ["read","reverse","append","prepend"]
length_bins = [1020,2030,3040]

for task in tasks:
    dfs = []
    for bins in length_bins:
        mat = [[],[],[]]
        for item in f1_:
            if len(item.split("\t"))==2:
                cat  = item.split("\t")[0]
                suffix = cat.split("_")[-1]
                vals = item.split("\t")[1]
                name = cat.split("_")[-2].replace(task,"")
                if str(suffix)==str(bins) and task in cat:
                    mat[0].append(np.array(float(vals)))
                    
        for item in f2_:
            if len(item.split("\t"))==2:
                cat  = item.split("\t")[0]
                suffix = cat.split("_")[-1]
                vals = item.split("\t")[1]
                if str(suffix)==str(bins) and task in cat:
                    mat[2].append(np.array(float(vals)))
        
        for item in f3_:
            if len(item.split("\t"))==2:
                cat  = item.split("\t")[0]
                suffix = cat.split("_")[-1]
                vals = item.split("\t")[1]
                if str(suffix)==str(bins) and task in cat:
                    mat[1].append(np.array(float(vals)))

        mat = np.array(mat).T
        # print(mat.shape)
        df = pd.DataFrame(mat,
                   index=["10-20", "20-30", "30-40"],
                   columns=["P_tiny","P_base","Base"])
        # print(df)
        dfs.append(df)
    plot_clustered_stacked(dfs,["10-20", "20-30", "30-40"],title="Task: "+task)
    plt.tight_layout()
    plt.savefig(task)
    plt.clf()
    plt.close()
    
    
                    
        
