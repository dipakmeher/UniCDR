#!/bin/bash
#SBATCH --partition=gpuq                    # the DGX only belongs in the 'gpu' partition
#SBATCH --qos=gpu                           # need to select 'gpu' QoS
#SBATCH --job-name=unicdr-job
#SBATCH --output=/scratch/dmeher/slurm_outputs/unicdr-job.%j.out
#SBATCH --error=/scratch/dmeher/slurm_outputs/unicdr-job.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1                 # up to 128; 
#SBATCH --gres=gpu:3g.40gb:1
#SBATCH --mem-per-cpu=80GB                 # memory per CORE; total memory is 1 TB (1,000,000 MB)
#SBATCH --export=ALL
#SBATCH --time=5-00:00:00                   # set to 1hr; please choose carefully
#SBATCH --mail-type=BEGIN,END,FAIL     # NONE,BEGIN,END,FAIL,REQUEUE,ALL,...
#SBATCH --mail-user=dmeher@gmu.edu   # Put your GMU email address here

set echo
umask 0027

# to see ID and state of GPUs assigned
nvidia-smi

#source /scratch/dmeher/custom_env/unicdr_env/bin/activate
module load gnu10
module load python
source /scratch/dmeher/custom_env/unicdr_env/bin/activate

# dual-user-inter
#CUDA_VISIBLE_DEVICES=1 
python -u /scratch/dmeher/UniCDR/UniCDR/train_rec.py  --static_sample --cuda --domains books_movie --task dual-user-inter --aggregator mean --num_epoch 10 

