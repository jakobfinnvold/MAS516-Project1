payload_pos = out.get("real_payload_pos");
payload_pos_ref = out.get("Payload_posref");
torque = out.get("torque");
time = out.get("tout");


tiledlayout(2,1);

nexttile
plot(payload_pos_ref);
hold on
plot(payload_pos)

title("Reference vs Feedback - Payload position")
xlabel('Time in s')
ylabel('Position in m')
legend('Payload position reference - Sinusoidal', 'Payload position feedback')
grid on


nexttile
plot(torque);
title("Torque output on shaft")
xlabel('Time in s')
ylabel('Torque in Nm')
legend('Torque Output')
grid on