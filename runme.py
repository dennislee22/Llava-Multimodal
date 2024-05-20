import subprocess, sys, os
CDSW_APP_PORT=os.environ['CDSW_APP_PORT'] 
os.system("cd ~/LLaVA; python -m llava.serve.controller --host 0.0.0.0 --port 10001 > llava_controller.log 2>&1 &")
os.system("cd ~/LLaVA; python -m llava.serve.model_worker --host 0.0.0.0 --controller http://localhost:10001 --port 40000 --worker http://localhost:40000 --model-path ~/llava-v1.5-7b > llava_worker.log 2>&1 &")
os.system("wait 10")
os.system("cd ~/LLaVA; python -m llava.serve.gradio_modified --controller http://localhost:10001 --host 127.0.0.1 --port $CDSW_APP_PORT --model-list-mode reload > llava_gradio.log 2>&1 &")
