import urllib.request
import json
import os

ROADMAPS = [
    {"id": "roadmap_frontend", "name": "frontend", "title": "Frontend Development", "description": "Step by step guide to becoming a frontend developer in 2026", "category": "Web Development"},
    {"id": "roadmap_backend", "name": "backend", "title": "Backend Development", "description": "Step by step guide to becoming a backend developer in 2026", "category": "Web Development"},
    {"id": "roadmap_ai", "name": "ai-engineer", "title": "AI Engineer", "description": "Step by step guide to becoming an AI Engineer in 2026", "category": "Artificial Intelligence"}
]

BASE_URL = "https://raw.githubusercontent.com/nilbuild/developer-roadmap/master/src/data/roadmaps/{name}/{name}.json"

def fetch_json(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    response = urllib.request.urlopen(req)
    return json.loads(response.read().decode('utf-8'))

def parse_roadmap(roadmap_info):
    url = BASE_URL.format(name=roadmap_info['name'])
    print(f"Fetching {url}")
    data = fetch_json(url)
    
    nodes_raw = data.get('nodes', [])
    edges_raw = data.get('edges', [])
    
    # Filter valid nodes (must have a label)
    valid_nodes = {}
    for n in nodes_raw:
        label = n.get('data', {}).get('label', '').strip()
        if label and n.get('type') not in ['vertical', 'horizontal', 'paragraph']:
            valid_nodes[n['id']] = {
                'id': n['id'],
                'label': label,
                'x': n.get('position', {}).get('x', 0),
                'y': n.get('position', {}).get('y', 0)
            }
            
    # Build graph
    adj = {nid: [] for nid in valid_nodes}
    in_degree = {nid: 0 for nid in valid_nodes}
    
    for e in edges_raw:
        src = e.get('source')
        tgt = e.get('target')
        if src in valid_nodes and tgt in valid_nodes:
            adj[src].append(tgt)
            in_degree[tgt] += 1
            
    # Find roots
    queue = [nid for nid, deg in in_degree.items() if deg == 0]
    # Sort roots by y-coordinate to pick the topmost as the main root
    queue.sort(key=lambda nid: valid_nodes[nid]['y'])
    
    # BFS to assign depths
    depths = {}
    for r in queue:
        depths[r] = 0
        
    ordered_nodes = []
    
    while queue:
        curr = queue.pop(0)
        ordered_nodes.append(valid_nodes[curr])
        curr_depth = depths[curr]
        
        for neighbor in adj[curr]:
            if neighbor not in depths: # simplistic to avoid cycles
                depths[neighbor] = curr_depth + 1
                queue.append(neighbor)
                
    # Any unconnected or unreached nodes? Just append them sorted by Y coordinate
    unreached = [valid_nodes[nid] for nid in valid_nodes if nid not in depths]
    unreached.sort(key=lambda n: n['y'])
    ordered_nodes.extend(unreached)
    
    # Clean up empty titles
    ordered_nodes = [n for n in ordered_nodes if n['label']]
    
    # Group into modules based on ordered_nodes (chunks of 12)
    chunk_size = 12
    modules = []
    
    for i in range(0, len(ordered_nodes), chunk_size):
        chunk = ordered_nodes[i:i+chunk_size]
        module_id = f"mod_{roadmap_info['id']}_{i//chunk_size + 1}"
        
        # Determine a rough title for the module based on its first node
        module_title = chunk[0]['label']
        if len(chunk) > 1:
            module_title += " & More"
            
        module = {
            "id": module_id,
            "title": module_title,
            "orderIndex": i//chunk_size + 1,
            "moduleType": "core",
            "nodes": [
                {
                    "id": f"node_{module_id}_{idx}",
                    "conceptName": n['label'],
                    "orderIndex": idx + 1
                }
                for idx, n in enumerate(chunk)
            ]
        }
        modules.append(module)
        
    return {
        "id": roadmap_info['id'],
        "title": roadmap_info['title'],
        "description": roadmap_info['description'],
        "category": roadmap_info['category'],
        "roadmapType": "curated",
        "modules": modules
    }

def main():
    results = []
    for r in ROADMAPS:
        try:
            parsed = parse_roadmap(r)
            results.append(parsed)
        except Exception as e:
            print(f"Failed to parse {r['name']}: {e}")
            
    out_path = os.path.join(os.path.dirname(__file__), '..', 'assets', 'data', 'curated_roadmaps.json')
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2)
        
    print(f"Successfully wrote {len(results)} roadmaps to {out_path}")

if __name__ == "__main__":
    main()
