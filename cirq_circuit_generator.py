import cirq
from pathlib import Path

circuit = cirq.Circuit()
q = [cirq.LineQubit(i) for i in range(3)]

circuit.append(cirq.H(q[0]))
circuit.append(cirq.T(q[1]))
circuit.append(cirq.CNOT(q[0], q[1]))
circuit.append(cirq.CNOT(q[1], q[2]))

print(circuit)

json_string = cirq.to_json(circuit)

print(json_string)

# json_file = open("circuit.json", "w")
# json_file.write(json_string)
# json_file.close()
path = Path(__file__).with_name("circuit.json")

json_file = open(path, "w")
json_file.write(json_string)
json_file.close()