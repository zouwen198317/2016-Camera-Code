until /home/ubuntu/code/build/camera; do
    echo "Camera server crashed with exit code $?. Respawning" >&2
    sleep 1
done
