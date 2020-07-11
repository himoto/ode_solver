from matplotlib import pyplot as plt


plt.rcParams['font.size'] = 32
plt.rcParams['axes.linewidth'] = 1.5
plt.rcParams['xtick.major.width'] = 1.5
plt.rcParams['ytick.major.width'] = 1.5
plt.rcParams['lines.linewidth'] = 3

plt.figure(figsize=(20,8))
plt.gca().spines['right'].set_visible(False)
plt.gca().spines['top'].set_visible(False)

plt.plot(t,Y[:, 0],label='Rabbits')
plt.plot(t,Y[:, 1],label='Foxes')
plt.xlabel('Time')
plt.xticks([0,3,6,9,12,15,18])
plt.ylabel('Population')
plt.legend(loc='upper right')


plt.savefig('population.png', bbox_inches='tight')